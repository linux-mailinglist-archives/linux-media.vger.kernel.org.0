Return-Path: <linux-media+bounces-33294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B277EAC2C18
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 01:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3AC61BA13E4
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 23:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BAA6214A6E;
	Fri, 23 May 2025 23:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="mgBFFz3w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D545213237
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 23:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748042528; cv=none; b=RibClESx1SCbxpna7hb5Kas1FZBlal2Qnlg6mB3RvlIiWTbrOj0fbCYELNlOefwycAbZrjZ21EXJKkIwldyaZxUE6R2xHiL3K+Za4y+AOHrmcWmXiIMRHwNsLJcb/+rEtvzMkOxSsRrG/vPLHNmcif9vjjtdi8r4aSgW3cdD92A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748042528; c=relaxed/simple;
	bh=0M6BIbKkCL4BuQHLkwNfOtXVF4FD4eT1saE9fb6Qwh8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JIMrCMGgOqYVj9cRz83elMDr0+zPieH5POg1t+CgqD6p7tKmY4xBNSVvf3kXJ1CBMFp2Q26/3rJhkWVa3707S3kFPKyQFXlsfR/6fa/+pgRejCgumJHc1/ACLh4pbR+beNWr6tZFp6ttD0+WoqLeanEM8KLYdArG4qwKrAIVjRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=mgBFFz3w; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c546334bdeso25864985a.2
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 16:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748042526; x=1748647326; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0M6BIbKkCL4BuQHLkwNfOtXVF4FD4eT1saE9fb6Qwh8=;
        b=mgBFFz3w2cyTb8yrNvb+YLOnmdBaojeZKHBuQVQP83wjAEOcmzgBVKK8Wm6v5KToHa
         oVjAbpaA6U+xt6HiHBRm9p7oUa7+pB32AmIDHPCQbOZ6X5SRHf4hwwFCRFoGF+NlB13z
         25DOx7qhUCnYA54t/S+1xCFX32sWUQWVNNPAB0TCq/rAQ5/lgaow7UFHQ1PViYdWqGsm
         VgM/+W/0CP1ToN9985XnDwKfwc+7Rj8c7yhY/7VR/4+rNqrrRtboZEBC/Bf8hy3G0xsF
         LIfqlZHOGC1WIYhMmQQeGNtC5qWBVfTbODRVAtD9yRNeWzIwbDcDAZsRXwHtSxX7gmTm
         Sptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748042526; x=1748647326;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0M6BIbKkCL4BuQHLkwNfOtXVF4FD4eT1saE9fb6Qwh8=;
        b=EqCV1wfwSnqe9ppq07v+oiH+B6bUTQU0j2e2JYrBz/cf70d5W3n72euj+MAygIeM8f
         g7QN2snP8Khj2jHnkFLk/cyIjEwtpg/ZImVhSIebmZcg9baXJK/8ieVYw8b1Z1NdHSEX
         X3d9Ia9nd7jv/+C7vH4WERQ5nhkcG9Pycv1u/7eeOez1IO4mplekW9muPeRTaYrkaMUP
         JGl2+HFb80HXDsAX0M32lEksg0IHTW+zMMm5nvnyjm0c70npNA764qHZxkzkaDThyKJk
         tB/jglffmLgjfBlcn+7K9010zDHJ5935Y+xqxMfkpXWLFKyWt7TS72sNtjlxi3v+4mgC
         cayw==
X-Forwarded-Encrypted: i=1; AJvYcCWpwZePhszjvPIMoxqbTeW4tBNuSUtyByW3aTcjHFq7KNW8OSOQu94PPrVPkJsx5uaON4RGk/iUifUsEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTzwgQoITBgorQhmcoykFmqg63B47xdtUaweZWGp/hqq5VWSA+
	n3qnG5zfHOalhjIz1n2+SQZ2Lzdka4Cvl4zaexnWYk0WYQWMNEKy5eDl7hx2iyeWNaA=
X-Gm-Gg: ASbGncvtHeDci0L50TGVx+7EygiF9v5c/i8LcsC5hhZ6tGF1Qhbx77zlBaqXrTUsrOa
	WEVvVcMijr2u6suqZcY+IVJVQX1DQiq+puK61R8nPJZf4OUhhpgMY4HNy80fILMzqYieWdp/ZrM
	5OFcros6lnVXVxDVM08+nxn9yMYN68BFDVQYQZXFgWL2fPEbXOyqAxdd+ZaHfwgLW74GdtxYxUu
	MPfrTz4JFeX2YfGNI1G++EE5YpVXbg1uZpJh8d0+NCkicxu4ySq/0oLib2Dc5yo006gaHg87ldL
	esxzRocnZK3swnq4CpFbe01SMBfbkTo8nkEPcY9dkd/bEsaq/oj1G/LM
X-Google-Smtp-Source: AGHT+IEIMXrXdUEGP0sasHkicBsBeTsvbtxxsfrCzTtv247fRI8qwLbIJGGL+3bJAWxBYrqeC4TcKQ==
X-Received: by 2002:a05:620a:319c:b0:7ca:dac1:a2d9 with SMTP id af79cd13be357-7ceecbe014fmr161204785a.28.1748042525994;
        Fri, 23 May 2025 16:22:05 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467ef2fbsm1249034185a.59.2025.05.23.16.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 16:22:05 -0700 (PDT)
Message-ID: <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	krzysztof.kozlowski@linaro.org
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ming.qian@nxp.com
Date: Fri, 23 May 2025 19:22:04 -0400
In-Reply-To: <20250521173444.310641-1-Frank.Li@nxp.com>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
	 <20250521173444.310641-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGksCgpMZSBtZXJjcmVkaSAyMSBtYWkgMjAyNSDDoCAxMzozNCAtMDQwMCwgRnJhbmsgTGkgYSDD
qWNyaXTCoDoKPiBBZGQgY29tcGF0aWJsZSBzdHJpbmdzICJueHAsaW14OTUtanBnZGVjIiBhbmQg
Im54cCxpbXg5NS1qcGdlbmMiLCB3aGljaAo+IGFyZSBiYWNrd2FyZCBjb21wYXRpYmxlIHdpdGgg
Im54cCxpbXg4cXhwLWpwZ2RlYyIgYW5kCj4gIm54cCxpbXg4cXhwLWpwZWdlbmMiLiBpLk1YOTUg
anVzdCBuZWVkIG9uZSBwb3dlciBkb21haW4gd2hpY2ggY29tYmluZQo+IHdyYXAgYW5kIGFsbCBz
bG90cyB0b2dldGhlci4gUmVkdWNlIG1pbkl0ZW1zIG9mIHBvd2VyLWRvbWFpbnMgdG8gMSBmb3IK
PiBpLk1YOTUgYW5kIGtlZXAgdGhlIHNhbWUgcmVzdHJpY3Rpb24gZm9yIG90aGVycy4KPiAKPiBS
ZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5h
cm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgoKQWNr
ZWQtYnk6IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4K
CktyenlzenRvZiwgd2lsbCB5b3UgdGFrZSB0aGlzIG9uZSBvbmNlIHRoZSBEVFMgcGFydCBpcyBy
ZWFkeSA/CgpyZWdhcmRzLApOaWNvbGFzCgo+IC0tLQo+IMKgLi4uL2JpbmRpbmdzL21lZGlhL254
cCxpbXg4LWpwZWcueWFtbMKgwqDCoMKgwqDCoMKgwqAgfCAyOCArKysrKysrKysrKysrKysrKy0t
Cj4gwqAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL254
cCxpbXg4LWpwZWcueWFtbAo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL254cCxpbXg4LWpwZWcueWFtbAo+IGluZGV4IDJiZTMwYzVmZGM4MzkuLjRjYmE0MmJhN2Nm
NzIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L254cCxpbXg4LWpwZWcueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9ueHAsaW14OC1qcGVnLnlhbWwKPiBAQCAtMjIsMTAgKzIyLDE0IEBAIHByb3Bl
cnRpZXM6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbnhwLGlteDhxeHAtanBnZGVjCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbnhwLGlteDhxeHAtanBnZW5jCj4gwqDCoMKgwqDC
oMKgIC0gaXRlbXM6Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBueHAsaW14OHFtLWpw
Z2RlYwo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIG54cCxpbXg4cW0tanBnZGVjCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0gbnhwLGlteDk1LWpwZ2RlYwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IG54cCxp
bXg4cXhwLWpwZ2RlYwo+IMKgwqDCoMKgwqDCoCAtIGl0ZW1zOgo+IC3CoMKgwqDCoMKgwqDCoMKg
wqAgLSBjb25zdDogbnhwLGlteDhxbS1qcGdlbmMKPiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51
bToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBueHAsaW14OHFtLWpwZ2VuYwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG54cCxpbXg5NS1qcGdlbmMKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGNvbnN0OiBueHAsaW14OHF4cC1qcGdlbmMKPiDCoAo+IMKgwqAgcmVnOgo+
IEBAIC00OCw3ICs1Miw3IEBAIHByb3BlcnRpZXM6Cj4gwqDCoMKgwqAgZGVzY3JpcHRpb246Cj4g
wqDCoMKgwqDCoMKgIExpc3Qgb2YgcGhhbmRsZSBhbmQgUE0gZG9tYWluIHNwZWNpZmllciBhcyBk
b2N1bWVudGVkIGluCj4gwqDCoMKgwqDCoMKgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wb3dlci9wb3dlcl9kb21haW4udHh0Cj4gLcKgwqDCoCBtaW5JdGVtczogMsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBXcmFwcGVyIGFuZCAxIHNsb3QKPiArwqDCoMKgIG1pbkl0
ZW1zOiAxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIFdyYXBwZXIgYW5kIGFsbCBzbG90
cwo+IMKgwqDCoMKgIG1heEl0ZW1zOiA1wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIFdy
YXBwZXIgYW5kIDQgc2xvdHMKPiDCoAo+IMKgcmVxdWlyZWQ6Cj4gQEAgLTU4LDYgKzYyLDI0IEBA
IHJlcXVpcmVkOgo+IMKgwqAgLSBpbnRlcnJ1cHRzCj4gwqDCoCAtIHBvd2VyLWRvbWFpbnMKPiDC
oAo+ICthbGxPZjoKPiArwqAgLSBpZjoKPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+ICvCoMKg
wqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBueHAsaW14OTUtanBnZW5jCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbnhw
LGlteDk1LWpwZ2RlYwo+ICvCoMKgwqAgdGhlbjoKPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+
ICvCoMKgwqDCoMKgwqDCoCBwb3dlci1kb21haW5zOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgbWF4
SXRlbXM6IDEKPiArwqDCoMKgIGVsc2U6Cj4gK8KgwqDCoMKgwqAgcHJvcGVydGllczoKPiArwqDC
oMKgwqDCoMKgwqAgcG93ZXItZG9tYWluczoKPiArwqDCoMKgwqDCoMKgwqDCoMKgIG1pbkl0ZW1z
OiAywqDCoMKgwqDCoMKgwqAgIyBXcmFwcGVyIGFuZCAxIHNsb3QKPiArCj4gKwo+IMKgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCj4gwqAKPiDCoGV4YW1wbGVzOgo=


