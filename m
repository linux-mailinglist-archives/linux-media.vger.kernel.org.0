Return-Path: <linux-media+bounces-22777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BE99E68C6
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 730261886189
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33021F03CD;
	Fri,  6 Dec 2024 08:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QwDLqc0p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DF61EBFED;
	Fri,  6 Dec 2024 08:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473643; cv=none; b=eTkVuvzr/SrDXlQ+1/9KCDmp46w89AACzYA7QvR5wyxkRsyg7nqif0VNglM6fBPHhiumrVmBXooViYh79726ahJpRIQ0K4SHkUZLqbJQRCx/yslt7vJPCe6mOKML+MkoNmgZGnq+Ac4Pjo1BK1qbYZfXoijSI+3633x6sUmcvsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473643; c=relaxed/simple;
	bh=LkrtmVOl+CazUBRYwt0hQd2QDWue5OQUhmwfZwpvQmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S8eV1uExU4C80qdBFmCjg3w4LeacALTmm5uqPH8SSLIq8G52wRpMyjD68Yge+mtktJJOUVamO4sbGmRX7mPP9bvUjR9GsYOwuEsWs0R2NR70DAmvKnEoOvG6r3zjrdy4KIYB7eqjAsx/5s6GQVmMwnFqTmuD/ixnf8g0pGvLXsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QwDLqc0p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39D6DFEF;
	Fri,  6 Dec 2024 09:26:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473606;
	bh=LkrtmVOl+CazUBRYwt0hQd2QDWue5OQUhmwfZwpvQmc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QwDLqc0p3GiO3zPyeth0dp8NyTpDYclVPTmLZcmxKkI40vruLm9vtuA3bPgBhTwji
	 pd0UpUM7BdoLCDtLxPGa/uKsOj7DXZzTHME/Nyt9Fvj2j/i2Ra0LYupqMnx0OAhsC5
	 HkE/dXxuEaOlOqd/m2asKuVawPskkZOoxt+2Me88=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:39 +0200
Subject: [PATCH v4 03/15] media: i2c: ds90ub960: Fix use of non-existing
 registers on UB9702
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-3-466786eec7cc@ideasonboard.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=LkrtmVOl+CazUBRYwt0hQd2QDWue5OQUhmwfZwpvQmc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVcIUwvIuPlqnt40tgXARlYtIhiOxMk2+lk7
 fifCIS29R6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1XAAKCRD6PaqMvJYe
 9ZHhEACxIUqxUqHcsQFg337cR5FuZNcItog6v6Qr6iyYw2uEp7YNmJoLyxvBr6PG05+mhEeryF0
 nLxVZ26yxCwGLXYzsQQEGYtiQLaPC8cc8ezK2yfsYSH7uXfOwkMBBImU26dNhWdzLkDw1L5sWSB
 7csQPzShu4DquwItrZklQ6Wz2rZ8hubZvfbX3Gt61Nh2tU6l/6unbFccKvARF+kWK02AjVxzjQB
 rqBnA3tDRss/Ity3bTczbYjiqoWb963011gX9RZBai/szKV+GdKbpFsBdildQOS0mJ8S+IHdsL0
 +L8+hE6NFHHfaXFvLaYqdLNicCucHjTjBQZXlIIMPsQDh/56AkfZ111qBLlR4TVMwpgpfILGfRo
 GpQouB6CHfpmnnPELE6hD7gJMunQbZM0bJj7ToPxYkDEAsiapZXMhJHka6iBwjhtyOjoDMdknDv
 HV4vafvDxVGe1N6K18mGaTy7I3SvOOh+O0GQWH1pR2pSDrCxgfZAgUU8bbyjX5S+ErsvwH3RPwD
 Me1Mxg17LAhrM8xCc39xO8ChgMv9RVhD8vvfXZmmeZJdp8ghe5pwmsgPg/MQec5K+iZPfywL2wS
 6qyDEe9goPs1v3Zl6dY1D78MA3hP0R2TrgijXc7OC5NaXTP+qZ90h4pLSpneW50u2Q0AZyp6urd
 pJU4OKX37OLTiOQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

UB9702 doesn't have the registers for SP and EQ. Adjust the code in
ub960_rxport_wait_locks() to not use those registers for UB9702. As
these values are only used for a debug print here, there's no functional
change.

Cc: stable@vger.kernel.org
Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index b1e848678218..24198b803eff 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1577,16 +1577,24 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 
 		ub960_rxport_read16(priv, nport, UB960_RR_RX_FREQ_HIGH, &v);
 
-		ret = ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
-		if (ret)
-			return ret;
+		if (priv->hw_data->is_ub9702) {
+			dev_dbg(dev, "\trx%u: locked, freq %llu Hz\n",
+				nport, (v * 1000000ULL) >> 8);
+		} else {
+			ret = ub960_rxport_get_strobe_pos(priv, nport,
+							  &strobe_pos);
+			if (ret)
+				return ret;
 
-		ret = ub960_rxport_get_eq_level(priv, nport, &eq_level);
-		if (ret)
-			return ret;
+			ret = ub960_rxport_get_eq_level(priv, nport, &eq_level);
+			if (ret)
+				return ret;
 
-		dev_dbg(dev, "\trx%u: locked, SP: %d, EQ: %u, freq %llu Hz\n",
-			nport, strobe_pos, eq_level, (v * 1000000ULL) >> 8);
+			dev_dbg(dev,
+				"\trx%u: locked, SP: %d, EQ: %u, freq %llu Hz\n",
+				nport, strobe_pos, eq_level,
+				(v * 1000000ULL) >> 8);
+		}
 	}
 
 	return 0;

-- 
2.43.0


