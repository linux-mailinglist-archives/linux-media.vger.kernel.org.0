Return-Path: <linux-media+bounces-55229-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EARuAE56sGnLjgIAu9opvQ
	(envelope-from <linux-media+bounces-55229-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:08:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6BF2575F6
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E991C3206DEC
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962333E9281;
	Tue, 10 Mar 2026 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br1H0f0x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E52F3D091D
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173176; cv=none; b=H6v88629zEMN0IEl68KWLpb/XaPfOKSztuBtaQfBbqxRFyj2cviG5a6XVQt/jfpzP3PGOV+GXfK+uIrYjzv4N798GZN7/iZ7Oaef1CBUKEj4t3yuO3jV2XKKKngG5VFF6XrFYHycioDIfD1fpgZjm+hyanxRj+pw2iwAA5x26Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173176; c=relaxed/simple;
	bh=kDaS0oBBZ1N5fMHKwDDGFI1Ivj7HNRUlOpYXqktu9XU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GTNkLqMBXtbCoxQ+mLyhbhSQrwMGwjgBJnk/WYlb2hMBW/X0CRW4q25HFmWkf3BsHhTqUYTCzasC1kKAB6wZiSef6fsfYeKb5u8zBmA+9XZAg4cAmt5JtT7z8LorDQSyxHcgVSo8n/ANH7yNWIjq4VVaSmto7fLsK5sCAVMGDT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br1H0f0x; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-829ac4670c4so2908396b3a.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173174; x=1773777974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FCnsZqgY0C/inqnWcqsCfogd4Ir01+XklcEE3giunQ=;
        b=Br1H0f0xNEmnRVdit6eCWnhKiAIxF57+hL5cuWoSgzcsmhcl0H4fTadmpRnrucYbyi
         k6B69BVDRwLURza7uEPkSGzv4X2akx195sgsSBju0X5030fSJ/oon16Xc4UWKFvr9s0K
         0F+DUYUcbxpepbVuV+5Tx4vHQAYj1JUqnXALQyQPjbfeVWfQ+wQ/IvhRgvB1B/Z3vhQH
         HjtZ8WiT0KaAfZ8qFzDOm4UMAGUGdSgn7xFNLlqMVldd1gsitzd4Ovk4tLvYQpmhAWdO
         L9G0Y7utYpQHJOURnY4NOsYCa28IsPbzZKHP0Z/d77vL+XEjOjZrQRtErU68R05y9hNG
         GMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173174; x=1773777974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+FCnsZqgY0C/inqnWcqsCfogd4Ir01+XklcEE3giunQ=;
        b=ojzZuWN2yebeQXQ4g7/Yaknj3z7OUIlwpoz+RkaQ0Kaj8K7meg9uqLThiwdMZ6vdvJ
         ZN22tNj5Oh8/wMH0xZU47a9QQILTsSms1N7zEDnKnvSqEloHOFdysp5VVLtRvq7sCcp5
         zZf4GilaJtNznA/GOvi+HVeUaqkh8mOllDRgcezc6BkoLuHh+/9RFD/7oMI9E0jD4HJe
         FjbyzK+12M2ODaXoc02rYI6N4mmM5FxkQHKoqkJMMEfTjqdK9Ts1pfQP22AYesQ0VrmW
         icYycikhWqPzRBPfFv+xg9EW+j8q+FQDZC7QgPwKQr+pVgrmkOHzf8HIZGtJvD5uITYA
         ySTA==
X-Forwarded-Encrypted: i=1; AJvYcCXwLBrouhjbyE+ch546xV9e2IIK7RHo+tyAG3A/Hfn3H20dhahpuidgQEwV6TNp5m5TYmA7naeZ3xsFrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypqeRrUvJGz71YHOuF71US7Bb7fXA2t7B2r8VxmZij1tdafzoS
	JDA7tjtVS0oKi+oVTsFmza16RpTv02aMGg1p3bDIsko+LRrlvt/ixtZr
X-Gm-Gg: ATEYQzyLAiP6/XhDGvfhzBo9NjvIrm6nKA9Slgl8MrFVE9A0s8gtAEx1AeiLnwwNynM
	CyyoUJhKX/lhgGS3QHr5pNwAXXe5PvLB8BwliAs/pkkZywrIbnFfkul429LwS1/4A470hAQC199
	lqmg9DUw7PE/Lvuv5I2pp6BES1V/XRKM32noJCvorfZi5JtwaZOVt1lUuGzcFShS0RRrrOvYfw/
	seCSqM6R6fey6S8b5D255nEw7P7hffhky84ykG1J2jp8pDBcksQNKvarR8UXBboqxT9428OjbJQ
	CuRJdfb73QZ2gYYSPPSa/NDxeFaQyeVlSVQZIBV7nuzt6xyeImQXllrjKgaCbRV0rU0x19Zbt9P
	1IATQ2+ogovRob0keykXjui8vDdjkFQjLOv0PDaCi0Hqmu5enYzEwQBOLouLnFFE1WHH8KWetXn
	P7mqoIhcfqqm1ToBjs91WUl7wHDCOAL7UKkqya9+Gq8WTA21LL
X-Received: by 2002:a05:6a00:3d4e:b0:81c:6ca8:7ff8 with SMTP id d2e1a72fcca58-829f71c43f1mr119633b3a.61.1773173174414;
        Tue, 10 Mar 2026 13:06:14 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:14 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 4/7] media: mediatek: vcodec: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:10 +0530
Message-Id: <20260310200513.2162018-5-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5B6BF2575F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55229-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 2da11521fc7b..3184939f793a 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
@@ -96,7 +96,7 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 	int total_len = 200 * (dbgfs->inst_count == 0 ? 1 : dbgfs->inst_count);
 	int used_len = 0, curr_len, ret;
 	bool dbgfs_index[MTK_VDEC_DBGFS_MAX] = {0};
-	char *buf = kmalloc(total_len, GFP_KERNEL);
+	char *buf __free(kfree) = kmalloc(total_len, GFP_KERNEL);
 
 	if (!buf)
 		return -ENOMEM;
@@ -134,7 +134,6 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 	mutex_unlock(&dbgfs->dbgfs_lock);
 read_buffer:
 	ret = simple_read_from_buffer(ubuf, count, ppos, buf, used_len);
-	kfree(buf);
 	return ret;
 }
 
-- 
2.34.1


