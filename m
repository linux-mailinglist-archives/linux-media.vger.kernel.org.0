Return-Path: <linux-media+bounces-51837-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UObZCPypfGkaOQIAu9opvQ
	(envelope-from <linux-media+bounces-51837-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:54:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D822BAC0F
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 459B73026417
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A47387353;
	Fri, 30 Jan 2026 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQui/aw0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AC83815DF
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777412; cv=none; b=DqARdlyXt9aVZHpGHtqL3Wi3zJ/HAUITRuVOLrjMOaK13zjsP+4XqhgiuxCd/7gW84dg5uYuHvYYQGLCNZrK0D8QzYkl4vggvXj7gBPjUvmrHcLbG2gt+5+qLFp0lQKdM0XxplU+gYpnTz80+meF0VUfEHiBi+5u5nZDcpMH9tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777412; c=relaxed/simple;
	bh=nYt6duhsrmz+e69NidfUvJL9FCPmAn4B/IKgU/QMe0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNJRwmeVGMaJZgUMuY4qBDS+KZTbHQjLCrQFJelkYhv17wY5fbyfB18dw20Uh7wd1W6xX0vTxZakCidcNR0NSGbP++cgSeWCaV+J2JcJ5lGC4Xif4HweMY3CspYfxleptIUGLO6K4exLAgtmdD4cbapQLmHcgLWS4f06WAwhbwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQui/aw0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4358fb60802so1293755f8f.1
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777408; x=1770382208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
        b=QQui/aw0YZeBIfX76/ZKWT7ZM12hScqRkKh4JJ/A8w5pXRLJGhdrpUYrQCxhnT60O+
         GLYBeYszVnuT7TgncVK9Wx3AC9uAoNAc8dD3s+tpnzt6kjFuerV9jyf627Hum/IGLQC7
         qwAQWB4eRG08Kh4ciCgsrOoWBjLwsnnbNg+EH0zq0bus9D0CpL+zCIWqxdlJ0x+wCnmB
         NwlF6D7R+TJ5YACRGjOqYdaVLQNB03q3fXZdNVaaPQrlxbLSVK5o3J8ZuTS4T4txq6Es
         90ITHFrBFU/Gtvgsg1DubHTHJ07OANkSBJ6AGNrPkuNMUlHm/YtS8xKlphtGr5XLH7ax
         BHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777408; x=1770382208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
        b=Kd8RupPyqfvQF6JrUxQ26djYWzguNr7d8SGGjxmaP4dV6RTOmdrl1uBOtt32QGonyb
         XgQ4o+cVAX+4o1i2P4L2+By+Ml9bZMk8Qp1UiHSqLdm1911oI7z1ECDnYlzNiYxDoV6x
         JtBmVdH5DCXuXe3OqGVW0wEZ/B0vFNNC6jZpgAu+t9wXksbvSkKDJsiOab1wVgkPBjqZ
         3A9RpuADAK4jZeQbeFbpXr9KleiLCmuSvIhK3oDa9DeM2zmfq2gNVQofmOEZeFnK6nGa
         GFYyREMXf98YfllHfM0GKMylLANCMVdK0ybBbA4YSdxIEUEgpCi0YLykWqFRqg08KgWN
         r7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXpeadApPbzwOpqDDQmuNBjCVIOcB5pWwlwaBJyLusdejqiz6SqWlR0ElR7tQgN3f9ITkXiBfMLlJIeRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1EoqV0OFnmnLNdfiQOQKYcq4RGvII+uOtpJIkwWSWScS2ZVy0
	1LHuQPYfYXS1NKZqa+JRGGvraspYt8RBnWmERJOytc245bQzpvwjPRdC
X-Gm-Gg: AZuq6aJcXL22qq8eJKIyJl+zBIEwnY9XyR/HFyS3FUORij6ezKOmVmAUa13G3LmRSZ4
	qmc3fbDBZdL8kVnYuRiZAWnf1lEoobHwCsMZLXxeisGzMcZ3StZzcPIf7SuxMgeXmHK+h2FCSv/
	FSMoW2NTMSUJH+K2STXhjrqbHWT82Ygyz3duIwg9HMhe/Z9sBliEThtYmJAeliA5ym84w1ZaUcA
	0XxMC7xy9K4ew5AGJ6KIzZUToyUq1t4W4AtCIukyZvuEWj0GQwmqYs+GJ+9Wxk80mSCASfaFmLV
	9CvcPtxSk17+qVGSwhT24Re5+02pxibJW72INQoeNQCfHwSsUxY7QQI1UruI2L0s2UPD6yJuGp/
	NbryT82ayPWXo2i3bN+YFfAGvbgaEyHiDahqYrwqYbvEOjlZTbl5H1/06R1yU7/JOi21AIq1HGV
	3W
X-Received: by 2002:a05:6000:178b:b0:432:dcb1:68bc with SMTP id ffacd0b85a97d-435ea2102d0mr8586769f8f.23.1769777407709;
        Fri, 30 Jan 2026 04:50:07 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:07 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 12/15] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Fri, 30 Jan 2026 14:49:29 +0200
Message-ID: <20260130124932.351328-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51837-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,bootlin.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D822BAC0F
X-Rspamd-Action: no action

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7ceefd920cd6..bf8755698610 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -598,7 +598,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.51.0


