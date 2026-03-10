Return-Path: <linux-media+bounces-55227-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILEDHN55sGnLjgIAu9opvQ
	(envelope-from <linux-media+bounces-55227-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:06:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C12D9257591
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C6103197176
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8686B3E8C69;
	Tue, 10 Mar 2026 20:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6CiRfU7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20E13D0906
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 20:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173153; cv=none; b=eueFrpdddK3MHaM9NlcJItXdY2EQTWqA7OoDeBk5ZGRwY+KGKnQ0iTrUFcI6Rwk0ED9BT2ufrPz2k9+UjVSRi+uzKFnH2JqgkAxbezhLzKBOL8CTzZDlXAjx4N259MPcBDvehIXzACRivIn4dhcfdGWso4X7joKhMqRG2ntZ9jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173153; c=relaxed/simple;
	bh=guApLfrSRuNxR3Y8l2tK1to2nzdDTARtdhHWSQ+XOAM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uSyiXXaAo6sdtVUok3Q1ifE/SBwVgDa2jw0LC4IcdUb0qgXxhVQD5FzjQk+jmP3F4Q/VNdLDVVpEsCAjZZq2hwrTjG/sNU4Sf7C2Rt+rpoHt03klZpBJVofWL1uvl5UaN3wKBI3pGqc3hyIEuMctZgkvGi2EMPkGMAjNE3kxnXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6CiRfU7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82976220e97so3660336b3a.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173151; x=1773777951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrH4PALLy5kRg8WwPkdWNLB7To1Zs5EdGhx79dnqSRo=;
        b=V6CiRfU7sZI10Zzxz5eRG3i6fSR5ZGQkJGgFJU7T7AHL0mOhDY73fsR9yjFXq5L3dH
         Xq74LAbXhAlsSwqGU+C2gytamTI0jXsavpeVIF3MnDQa7UChff8zRv/pX7NhvfzFnlhU
         HlyHxSUnN3px0sbix2jrve1xR6WT8f22AEmq8pvTIjl0jPqg2uKOrJyDMAYHglH3FaEX
         PUr702IzE6fiQuONpFAFmXYVi0jCWldrZMJ657J4qLtzkybB8mp6ACGtKnkF4gS+ehto
         ELReGzbIBSb1l2RAvTgShr4GUx6FlFKH6HtOInPFsLPDohZ7hxSFrJl3GzyNCd6QSjVk
         w9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173151; x=1773777951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrH4PALLy5kRg8WwPkdWNLB7To1Zs5EdGhx79dnqSRo=;
        b=hzpPfn0sR1mACKMhWrvTfFt4EHf3VNd649tW+5UadVM9aBblGOffarq66KAKZrUmMP
         4Xx0RnpkyblTAPUy7uf1GLkKHW5Eo1Q0qcntOL8+gm7JIsUVMLksbZ8/RU94sBjf78I8
         Q321CPF+xyMfQftgoqGn0+N1rr5biiOAeMoRfAcO31OLiwRFjlCbB90QuPDnMlQEsKe6
         GPYfxFZ8dQ/2VzFjynAJ6XLLMqHBEAnPzNO3K3BAh9Rn3OMIaBBgnpXBweOwkc7p0TWV
         yd+aIM2R20ZoenQ7wZfv7GHZKdOngYQxrHN0K3wjo/wJgK0zaEg+yfswgcOvOvlOQE/o
         2m/A==
X-Forwarded-Encrypted: i=1; AJvYcCVZ9OC4NmGh6bLvIxJuDcTF7FgChpQo0JR6ZeP3MTQsuBbXT0HhNS25OV0NdfvBFCCiXmzGlbxF/fMcRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwCxIQMlFqck8IBDp09u3BsDb/AD/Kl5YEHWZubFoehQK9UuP1
	dWRddlKjHnf4Ft0syE+JW+W5XLnwWLhKeDwlFBSVerbXXu/m7S8BDPdU
X-Gm-Gg: ATEYQzxxK6ohVEaX6tO5xkH6WIdjA32LLykjGxcE/RVyBKEUfK2iQ6YRJypHuEKOFHS
	l5MQPGDdedKVnlz7Uw5bfavI44W8SdtN3NvsA7B2GzQdhevd7r+sTfdq5JvTYIqJOfLq7N1LeDD
	DK+qa8mxt+HJ4PbKqqIo+10PW4KA6gYEdAI6wN5J1I3iJousQZ+FR4aYNp1ewLrz4aFHmaVAXah
	ldQf+3gXhXn9NspIwfV91SBlgO9IJuDQSd/fbVhnb5WgOT1Zj0FBIFSa+35W49/UUl67PYZPeK2
	1hjl7RSkCDmGWzvx3lp/mKExhoWw6ZCJv783jWez2kIPCG1rs4fC3/MsOBBGb9vctbnAT0HvPcC
	R2U4yB8xCll5RkVbz+/Rq3sKPFTsBmpQUHXxZIW9BCIfWpVZziGHl2OQigUcNgpfZXIXj68O3iB
	YLo+0BlcdaAcvE/YFrNLXeOZFd34t6KnQDl5kr8ANhcErZ6KOaT7r1ox0WItM=
X-Received: by 2002:a05:6a00:1c9e:b0:829:88e7:c89e with SMTP id d2e1a72fcca58-829f6ee65abmr156570b3a.9.1773173151308;
        Tue, 10 Mar 2026 13:05:51 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:05:50 -0700 (PDT)
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
Subject: [PATCH 2/7] iio: ssp_sensors: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:08 +0530
Message-Id: <20260310200513.2162018-3-sanjayembedded@gmail.com>
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
X-Rspamd-Queue-Id: C12D9257591
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
	TAGGED_FROM(0.00)[bounces-55227-lists,linux-media=lfdr.de];
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
 drivers/iio/common/ssp_sensors/ssp_spi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/common/ssp_sensors/ssp_spi.c b/drivers/iio/common/ssp_sensors/ssp_spi.c
index 6c81c0385fb5..e76ef39c6b7c 100644
--- a/drivers/iio/common/ssp_sensors/ssp_spi.c
+++ b/drivers/iio/common/ssp_sensors/ssp_spi.c
@@ -331,7 +331,6 @@ static int ssp_parse_dataframe(struct ssp_data *data, char *dataframe, int len)
 /* threaded irq */
 int ssp_irq_msg(struct ssp_data *data)
 {
-	char *buffer;
 	u8 msg_type;
 	int ret;
 	u16 length, msg_options;
@@ -375,7 +374,7 @@ int ssp_irq_msg(struct ssp_data *data)
 			 * but the slave should not send such ones - it is to
 			 * check but let's handle this
 			 */
-			buffer = kmalloc(length, GFP_KERNEL | GFP_DMA);
+			char *buffer __free(kfree) = kmalloc(length, GFP_KERNEL | GFP_DMA);
 			if (!buffer) {
 				ret = -ENOMEM;
 				goto _unlock;
@@ -386,8 +385,6 @@ int ssp_irq_msg(struct ssp_data *data)
 			if (ret >= 0)
 				ret = -EPROTO;
 
-			kfree(buffer);
-
 			dev_err(SSP_DEV, "No match error %x\n",
 				msg_options);
 
@@ -420,20 +417,18 @@ int ssp_irq_msg(struct ssp_data *data)
 		mutex_unlock(&data->pending_lock);
 		break;
 	case SSP_HUB2AP_WRITE:
-		buffer = kzalloc(length, GFP_KERNEL | GFP_DMA);
+		char *buffer __free(kfree) = kzalloc(length, GFP_KERNEL | GFP_DMA);
 		if (!buffer)
 			return -ENOMEM;
 
 		ret = spi_read(data->spi, buffer, length);
 		if (ret < 0) {
 			dev_err(SSP_DEV, "spi read fail\n");
-			kfree(buffer);
 			break;
 		}
 
 		ret = ssp_parse_dataframe(data, buffer, length);
 
-		kfree(buffer);
 		break;
 
 	default:
-- 
2.34.1


