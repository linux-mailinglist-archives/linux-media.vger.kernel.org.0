Return-Path: <linux-media+bounces-52423-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEG4MXf/iWluFQAAu9opvQ
	(envelope-from <linux-media+bounces-52423-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:38:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 733A9111FA2
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1EDC300AC9D
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159C937FF68;
	Mon,  9 Feb 2026 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="tlTfukcI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A0937F8D7
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 15:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651493; cv=none; b=i1nfaYZmBoSxRjSrD7Rcnlp+cxifPvmStFq3pUiTZe8uLW6KI1Y5Aw7LsRpUJlklxkA5cEbx6CYuU5hL8YpxL9uY8TfUr0Mj4RIt5togxfW6Vx92EjtNnVG1MyCJ4OoeJmrClAMlfG82o8ZbT9LaXcHQl4I3mE2LpwJQZ4IsjAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651493; c=relaxed/simple;
	bh=iaj2yH89Vn8424NatbEPy5zTcXkE8fBUuo+9v66/cM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L07C0vhZw7+yZ36kj15uxjXPQje8meUpXRiOnJVCl/jtD5BazzHQNz2Se3J4IYw86PoOFmHHPmfxGk1x790iR4Y19aXBIr1ViJWqVd7xLf3jtvzGgYBdP5h2Nkq/Q2vXNCzdfUhX4JPSo//a6o415C1qlG7trlClwB05vvGIcB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=tlTfukcI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483487335c2so5393275e9.2
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 07:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770651491; x=1771256291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jk99TzIHNfOaBko9b1E43IwPHNs+vzenJUms8qd4tnM=;
        b=tlTfukcIYMUqXVQUgwc6eRgIbvKKxofTYVyReOLCIFax4a0PV7P2xnua3EFDPjxIBQ
         Ywu8DfYtkvMChl/ztdkNBERorRR+kQsd/fdU/c0PnNwciLlUUb54be962YF7vNHw+6ZC
         UgL1DACnNTxsxkGAftlpw+v9kZ1M+wJTLeHGX0oaWXttOa9vnlugio2i1nyCXHlp1H6r
         PS/fTxM+zZQmtocgEYyWjie7rXuDYzdzw7LH3Iyi0jKmv1Yadx5RcONynd1yHSLi5+HD
         ghDO3eWK/WgInefHvc2bx339zrb/HtrD9dK+V6RmSfUKimNJ/qHgY8wJamVfXs+qJtrZ
         q3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770651491; x=1771256291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jk99TzIHNfOaBko9b1E43IwPHNs+vzenJUms8qd4tnM=;
        b=MyE2x0UarEEAS4/icrf6WgbSChz7OKd8hxVTjtNX+dyZ8GUxUGrSs8oPjTbWFcxOqB
         aOLxi/n6KUSAAPFYYMhmkGw4i3b/Q39/hS8F2dqRFSSIc3APRZdAJNdK8jwFg1MG1TK2
         jI/NACPOsoG/ohk8JShDRmkXD67tUM0Szgrpf4ADFvJqNCY2ZUEQt2uV1Pl1nSR+6dCU
         AxsATmPLlKDt2LAgUdXOWpKBOMBpavslP+TklusKxv5+HDV22MLEBFtch43ah2FSNPTL
         KY9YYWsHM8usCYoPkADF3hWbN2ELHy+r21U9O9CzUBaPVBlr96FjubT/MaJ3Ic3tqrkI
         ElrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLLJz5O1Erc7s8BJkK4l5WSYzTQfuH8JIeVMb/z3KmeVkPgUZWJzaFWecrR/A/zNc8sDi+lWtU2q+W/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyotXm5VaK0Y7YLcn2eao7IU5PSSxYl2jAgv8SuS7aZYMhnPnuV
	7pzU/mKRd7pjXBaHMMN4wOx2kEyes8K8Zqt4ipxeBdYnDZkq7HikPM8E7FxADOC5kIw=
X-Gm-Gg: AZuq6aJKzdzrZq17QaDsC5/6lnjfo/46xr74MCoV7ZO1Mb8c5nNepq9dr8rtZDFUYcx
	afgNzMUs0G0BxW/6EWbDz4N91Nr8g5g3ojC2Gq13cUlLjo+4mRfFM2SJsFF+lBLAK5BcGB+O8oY
	Ocd/RTWZXAHW442lzbv/oJK1017lVBDeYF5uAHoWAXzUuT9ObAUjDNbs9qpaSWnUDzvuqlHuM2N
	I8Pz/s5yisNDPVfNe0udwnAIBoWSXZf5dbwhQAG+7mX37kSP452J+LaRpDnT5keIW3/nIEIdmhB
	MEErzRpWRFQODMGs6Tgsbg6yFcNZka89o8t0wbAbzPnZSuR/2gu9hrVHHD0wiLozQDweCfEDaVQ
	iQPPsYiyRlTK0gJMDKi4nq98r2FFU9tUbCx7seFUvGxhGSCCHBR6pC+lxbi1kf1wENOzm0tYkgG
	enRw==
X-Received: by 2002:a05:600c:6592:b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-483209c6dd4mr181313355e9.34.1770651491431;
        Mon, 09 Feb 2026 07:38:11 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm11560760f8f.20.2026.02.09.07.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:38:11 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	sean.anderson@linux.dev,
	ptesarik@suse.com,
	catalin.marinas@arm.com,
	aneesh.kumar@kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	thomas.lendacky@amd.com,
	john.allen@amd.com,
	ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: [PATCH 1/5] dma-mapping: avoid random addr value print out on error path
Date: Mon,  9 Feb 2026 16:38:05 +0100
Message-ID: <20260209153809.250835-2-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260209153809.250835-1-jiri@resnulli.us>
References: <20260209153809.250835-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52423-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli.us:mid,nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,resnulli-us.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 733A9111FA2
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

dma_addr is unitialized in dma_direct_map_phys() when swiotlb is forced
and DMA_ATTR_MMIO is set which leads to random value print out in
warning. Fix that by just returning DMA_MAPPING_ERROR.

Fixes: e53d29f957b3 ("dma-mapping: convert dma_direct_*map_page to be phys_addr_t based")
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 kernel/dma/direct.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index da2fadf45bcd..62f0d9d0ba02 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -88,7 +88,7 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 
 	if (is_swiotlb_force_bounce(dev)) {
 		if (attrs & DMA_ATTR_MMIO)
-			goto err_overflow;
+			return DMA_MAPPING_ERROR;
 
 		return swiotlb_map(dev, phys, size, dir, attrs);
 	}
-- 
2.51.1


