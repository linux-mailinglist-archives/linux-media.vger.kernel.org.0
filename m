Return-Path: <linux-media+bounces-17130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CA0964439
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 14:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A55AE1C22900
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 12:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C812D19413F;
	Thu, 29 Aug 2024 12:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+RHcipT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AAD18D63A
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 12:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933888; cv=none; b=idc/S+5ECdauM2mzS62zmPMq+WTJJ/BwmVjvV021JGWhCGi5eImrvVNNLcn2wo95GUaMgLnWktUXo9jEbKC9urDF0iUrdhja0o72kc/vS4mf4b6b+UGRVyts9RmDW0Z5p7ftitO9NP2SVwDOHxdEPe3FYXT1gLok7nCcmL77d80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933888; c=relaxed/simple;
	bh=NAleUao3rBpGJ0QyQE7nvTOTnEbsHg7lJWbfAIByRcc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=o9F98/lGOi4YDPbA+ZRAJC3yjmeRFWzI8Yvj9/ApKrRVPrbhHfRBBsyuu+3yHZj/TxVFTJheBHnyUnE8eVtH0bwzu6xRRYrfIDyAS3Tt6MBG5Pb9cP8qbyqq6virkD0zKe3M3tW8jGpYVHsL2JeLUMssdkh5zcX+68LhOjFVPyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+RHcipT; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6bf7a2035d9so16072866d6.1
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 05:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724933886; x=1725538686; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CrSHk59d04R7WMEhdAUL7SdkbVbNd0xSx4vw38IFvvU=;
        b=H+RHcipTMMyrOd5M7yuZfolUU/9WOjf/odTBDm+A56sgQAoha/7SjgGYnMPva4M6R7
         7SzP+7OuIkP1JmEMH9WbqNamCmJWVI1U3CC4diZcuX9bt4BbUw9WpbSFKYRVjU/GLW8V
         QWSsqlw/+eU35YxBV1/S2zKEMuikmcfZOZNUb9/5IxWBUCf3lRSnN+Durl7VkRuL6hqK
         AWttvFWieIeVVqDKRuUuMvucqSXLxDDIvgMfUcxyPlFpOcECZw9hwad+AZMZlOfCMyEE
         I33QNga53f0yDGChgsbxWK9UsWj3VLwluLz0uJrRvsDFqJNUPu+0XemN/VFnN5gbP4ud
         bHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724933886; x=1725538686;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CrSHk59d04R7WMEhdAUL7SdkbVbNd0xSx4vw38IFvvU=;
        b=hGkXNet6iAJANaspOEJACUDesGcrwevmcBb8ZtNuKdUXMwPEHxzgU7OyTpBUpdQLV7
         qNopX40eJgtIxrCYG+tsyPHNq8oBmB3Rv4DTwSJW8E+Wy9qU0SmsuMS1KmPyvmWhBvlt
         +rBFkbb0YsHUm6rkvophgViR+ko5a46NPCSnFadzbEmxLH3qcqUL8amermfKD+mH5f8q
         49IZUj4Bc4k2gDaFgJ38budlB3YI4vw77exQkub+SUvEYZKcyNai/V10swtMIHuuPUo4
         eSa03C49L9ysYR+zDj1eHl9P9vvnejcbKIuMT+mtAIGkKEkXPBgvqVhkv/LqxS1QzGMH
         XeUg==
X-Forwarded-Encrypted: i=1; AJvYcCUKEg/G3JLULBZBJsJ9sfjQCgSZQU/TWZJtI9s5vWGGXHHg59MFe6i+vUcrT1pIRID1yi7nu9Yq6VGeFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4eg3yj6ntNPut4BsltH/jevOHHyp6nHB5xWA5EB2NhCrkxE2G
	awqSrBtjD2mRPVWfhJqw8kYFEhUJ6PdP2l2UFZkFE9Gbt6n4QwJXxxq7eMl82nyBCIi6psf4KtI
	kzrXEky6moUeIf7b4PVZLc3d8I3RBisim
X-Google-Smtp-Source: AGHT+IEtgdgRFGB8fqzYRs/YzoXhF4Ip9YuTadgqdbvFCkjjcQefV6rN98vMOJCMNxSnMVPUV6JSHM565vliGDzrHws=
X-Received: by 2002:a05:6214:5344:b0:6c1:84ce:8f31 with SMTP id
 6a1803df08f44-6c341b8f382mr20692756d6.0.1724933885637; Thu, 29 Aug 2024
 05:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amil Sanan <amilsananak@gmail.com>
Date: Thu, 29 Aug 2024 17:47:53 +0530
Message-ID: <CABprV6SKOJCZBG795YBj1M5UAZP1_nR1aC+-ctxALv4nv-ST6A@mail.gmail.com>
Subject: added a new device in uvc_video.c
To: laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, 
	dan.scally@ideasonboard.com
Content-Type: multipart/mixed; boundary="00000000000083f0fe0620d177d3"

--00000000000083f0fe0620d177d3
Content-Type: multipart/alternative; boundary="00000000000083f0fd0620d177d1"

--00000000000083f0fd0620d177d1
Content-Type: text/plain; charset="UTF-8"

it is a webcam on new 'acer aspire 7' laptop

--00000000000083f0fd0620d177d1
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">it is a webcam on new &#39;acer aspire 7&#39; laptop<br></div>

--00000000000083f0fd0620d177d1--
--00000000000083f0fe0620d177d3
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-add-a-device-in-uvc_driver.patch"
Content-Disposition: attachment; 
	filename="0001-add-a-device-in-uvc_driver.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m0f90nfa0>
X-Attachment-Id: f_m0f90nfa0

RnJvbSBkMThhZDNiZjliYmM5M2RhM2VlYjBjYTRlYTY1OTg5NTVhYzA1YTk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBhbWlsc2FuYW4gPGFtaWxzYW5hbmFrQGdtYWlsLmNvbT4KRGF0
ZTogVGh1LCAyOSBBdWcgMjAyNCAxNzozODoyNSArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIGFkZCBh
IGRldmljZSBpbiB1dmNfZHJpdmVyCgpTaWduZWQtb2ZmLWJ5OiBhbWlsc2FuYW4gPGFtaWxzYW5h
bmFrQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2RyaXZlci5jIHwg
OSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2RyaXZlci5jIGIvZHJpdmVycy9tZWRpYS91c2Iv
dXZjL3V2Y19kcml2ZXIuYwppbmRleCBmMGZlYmRjMDguLjFhMzIyOWFiNiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tZWRpYS91c2IvdXZjL3V2Y19kcml2ZXIuYworKysgYi9kcml2ZXJzL21lZGlhL3Vz
Yi91dmMvdXZjX2RyaXZlci5jCkBAIC0yNDQxLDYgKzI0NDEsMTUgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCB1c2JfZGV2aWNlX2lkIHV2Y19pZHNbXSA9IHsKIAkgIC5kcml2ZXJfaW5mbwkJPSAoa2Vy
bmVsX3Vsb25nX3QpJihjb25zdCBzdHJ1Y3QgdXZjX2RldmljZV9pbmZvKXsKIAkJLnV2Y192ZXJz
aW9uID0gMHgwMTBhLAogCSAgfSB9LAorCSAgeyAubWF0Y2hfZmxhZ3MgCT0gVVNCX0RFVklDRV9J
RF9NQVRDSF9ERVZJQ0UKKwkJCXwgVVNCX0RFVklDRV9JRF9NQVRDSF9JTlRfSU5GTywKKwkgIC5p
ZFZlbmRvciA9IDB4MDQwOCwKKwkgIC5pZFByb2R1Y3QgPSAweDQwMzMsCisJICAuYkludGVyZmFj
ZUNsYXNzID0gVVNCX0NMQVNTX1ZJREVPLAorCSAgLmJJbnRlcmZhY2VTdWJDbGFzcyA9IDEsCisJ
ICAuYkludGVyZmFjZVByb3RvY29sID0JVVZDX1BDX1BST1RPQ09MXzE1LAorCSAgLmRyaXZlcl9p
bmZvID0gKGtlcm5lbF91bG9uZ190KSAmKGNvbnN0IHN0cnVjdCB1dmNfZGV2aWNlX2luZm8gKSAK
KwkJey51dmNfdmVyc2lvbiA9IDB4MDEwYSwgfSB9LAogCS8qIExvZ2lMaW5rIFdpcmVsZXNzIFdl
YmNhbSAqLwogCXsgLm1hdGNoX2ZsYWdzCQk9IFVTQl9ERVZJQ0VfSURfTUFUQ0hfREVWSUNFCiAJ
CQkJfCBVU0JfREVWSUNFX0lEX01BVENIX0lOVF9JTkZPLAotLSAKMi40My4wCgo=
--00000000000083f0fe0620d177d3--

