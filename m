Return-Path: <linux-media+bounces-25165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B86B0A196F5
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 17:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49F6518855EA
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 16:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8CB215073;
	Wed, 22 Jan 2025 16:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lKUj+eBP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wEwQTGJq"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A3C21516D;
	Wed, 22 Jan 2025 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564881; cv=none; b=LuyUZafgYvhk227Fn+28FKXmKu3bf8J06dEzrygLmOhWPhRhjQne+oLO7t1a1vNCEypI9SAkrFnEOn674n1N+ctJqbqlRpznE1a/XoCK93OgOetox1CubMOMO5e0Dac3apS49M9CgKt042Jt2q/6VCSp6QB044u63ln2K3xoeKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564881; c=relaxed/simple;
	bh=OtFtjgDLLYZ1ZVjfW7PIj075KJ/m254pyU9vTHLYHGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HIUi50/nUjAmZ6ZBoCsaoEu2+mIsoA4yypBuXg+S5AYCi3K7VM1QiouDuxlOggiSqM2g0fDCuK663+eVHGEh7PLS8Y7oTQeDBGMKsjPyHsDPhT7V+cbAmlkxKRba+2If5F3XvCmLv26VUfZGywhAd9vHD5vsrJ8bBU8ijTEjf24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lKUj+eBP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wEwQTGJq; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id BC60611400BA;
	Wed, 22 Jan 2025 11:54:38 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 22 Jan 2025 11:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737564878;
	 x=1737651278; bh=U/QiFlEfQsIFW5Mkqt1H/B5V7hpE0iV7gdonwO0q4jg=; b=
	lKUj+eBPcQiBm5HvZdPq1oTafNiiR+CMvV5Orsjur42QAunpcgNN6ceB3iTtfxHT
	4hGEraaRgTrr/9M1i90O8tgFakuIjSOc72TXse4ceIhxevGoGzCeE5LpIDl1NvLc
	edILv5s97p6P0M6rtNa3xwJwz6G0F4Y8etAjoyBfeGs3WVBLGcE8YmLiQzXIgk6N
	kjPjw13ljNb4Ef3B8kFKWBxCI/FMq6PU60AB3sLCMbimwccIiWTyDbagU/WCmYYp
	zmiABrQHBO8OzCaC71KWwMDB5tyP3PRg+ck3bZgT2JGbIL8T0FxUnRJI6Fp8BYIX
	7E7VaFOo2tSZ4TjBggk4qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737564878; x=
	1737651278; bh=U/QiFlEfQsIFW5Mkqt1H/B5V7hpE0iV7gdonwO0q4jg=; b=w
	EwQTGJqLbLrpCr2fkDg31/+Mu+9s2sJjjR5ZqhYTUnsKs8CThlJEtLCQBAhvFPuM
	pECdUsO3xeEtBNX6OxM+BOV92HDjikGZVRr53SP4NdtRKydZVb7qxIuBYJ4JFfO/
	fzufK+LXyxdjVndSWAUzjK3z5XU8Z0fTrCtQ0/aVtbL587+AGAF4mdcf3ob3gVk4
	4b9zyixNruupekE+RGDr6MqheQhCZ87plRrahFir65LNRbS0blIJH28kHn2Bcjt8
	uy8yMOn3QKztiucgYgo/NlkSHzFqo426Io4R4dGCwQjLqIcCizPQ10gf8oCVPkT8
	++2rzK5NS/SkNIZszY4Qw==
X-ME-Sender: <xms:ziKRZ3xHgW29w2oVmH8hbWG_jLp0GP7UkM1XPFXlGj7RbCL9FPSLDg>
    <xme:ziKRZ_TzinyR0_oVypaAUsgikzD0ZdEAi4P1py2vnSVVosO2sD5SYLIrB3pqt2WVC
    oDVyvvfB0rCL9LdA_g>
X-ME-Received: <xmr:ziKRZxVvp1KK5nwKjGXb_tteT-ImvEN3qLQDYjltxhilAoLfhtPPIxoH_8pwMVk-f-WIog2c1hGZisEZWuXvdMPIaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedgvddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgv
X-ME-Proxy: <xmx:ziKRZxiWVoHXyNbKGdkZAjuDGZDOVO-bEC02NfHZMTGVAKb6ikHbLQ>
    <xmx:ziKRZ5A8G0fAv_P4iWRt3uCmyteu1Lvmd60l3kT5GTnZmhFfA4ojHQ>
    <xmx:ziKRZ6LFqPSwharOBsQAtt1M03JUWd_c2fzALT7-pirzgz2AABN9pA>
    <xmx:ziKRZ4BDYe0vA7EH0bE_GuHvZ4GAFmTeO37UEo0AOicZSwouroVJKA>
    <xmx:ziKRZ72D_1-qaCKIi7IPZeem2x8sEkXhSfjDS8JK6ELLjM_HtvW5F9mh>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jan 2025 11:54:37 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 5/5] media: rcar-csi2: Remove hack to detect NTSC content
Date: Wed, 22 Jan 2025 17:53:53 +0100
Message-ID: <20250122165353.1273739-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In an effort to emulate support for SEQ_{TB,BT} in the R-Car VIN driver
on data captured from a CVBS input a hack was added to detect NTSC vs
PAL. This is ugly and as support for emulated SEQ_{TB,BT} have been
removed from the VIN driver remove the ugly hack.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 0a53dd47d7bf..7dfa2729209d 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1045,16 +1045,10 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 			vcdt2 |= vcdt_part << ((i % 2) * 16);
 	}
 
-	if (fmt->field == V4L2_FIELD_ALTERNATE) {
+	if (fmt->field == V4L2_FIELD_ALTERNATE)
 		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
 			| FLD_FLD_EN;
 
-		if (fmt->height == 240)
-			fld |= FLD_FLD_NUM(0);
-		else
-			fld |= FLD_FLD_NUM(1);
-	}
-
 	/*
 	 * Get the number of active data lanes inspecting the remote mbus
 	 * configuration.
-- 
2.48.1


