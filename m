Return-Path: <linux-media+bounces-20818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5509BC2B2
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 02:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B2E4282FF0
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 01:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072C122098;
	Tue,  5 Nov 2024 01:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BLj2Vt3v"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C02CA4E;
	Tue,  5 Nov 2024 01:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730770580; cv=none; b=NbJQzg+eDCp0l261EmHL9oVyigWOQ4ALcYakEaUMrf/sF3Ac1AXKKx1Zum+lZYT0sMXI68zWhq9e+O4Elbu07rF1KJ84o0swwNoUOpIdVVIAIOOPaL91/wQwvVsBNvMh4lzfLr6lhk0e7/0Wk1TYBr9o9MQJcKF+gUb/r6Hra9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730770580; c=relaxed/simple;
	bh=mXeo0NHHCWOe2iM4PPa2hl09AfQTjMX6HTfL1nop8dk=;
	h=Date:From:To:Cc:Subject:References:Mime-Version:Message-ID:
	 Content-Type; b=hL/pEpM0bcE0HzLhuMwUEesoWJknXW/rJ/bVlNi/X22AVce4MAXQSyXrwyY1GHUawjyn9PwxwOvxznv4qU/KyWn6u9RABZmJ/FoeKeNiyQD176cpXaAQRjH5QGmKJB4QPCywFyIvvTnxhr7hyhgzsq1YifRhVFCVA0C78mLGkDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BLj2Vt3v; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Mime-Version:Message-ID:
	Content-Type; bh=mXeo0NHHCWOe2iM4PPa2hl09AfQTjMX6HTfL1nop8dk=;
	b=BLj2Vt3vFHEzOr5eTanmUsfmH98y8rNDBu5Gx/+34t9EcO+mm8Nmpqd7Ltex2P
	CfYiEBlUOG2CbBgrlbOSzdtMLiDekIGgHY1M/1i9itAodT97H6j2ZpGGDhCNha+U
	flENoxCPtg0jun8N8sH6Bb9StRddJLlWqMxPHjLI2HC0Q=
Received: from ccc-pc (unknown [111.48.69.247])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3n9p4dilnuNMTAg--.21464S2;
	Tue, 05 Nov 2024 09:35:53 +0800 (CST)
Date: Tue, 5 Nov 2024 09:35:53 +0800
From: "ccc194101@163.com" <ccc194101@163.com>
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>
Cc: laurent.pinchart <laurent.pinchart@ideasonboard.com>, 
	mchehab <mchehab@kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	stable <stable@vger.kernel.org>
Subject: Re: Re: [PATCH] media: uvcvideo:Create input device for all uvc devices with status endpoints.
References: <20241104023947.826707-1-ccc194101@163.com>, 
	<20241104110553.6687a58e@foz.lan>
X-Priority: 3
X-GUID: 4A308367-33E1-4EE7-B4ED-9EFB2211354C
X-Has-Attach: no
X-Mailer: Foxmail 7.2.23.121[cn]
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <202411050934200431623@163.com>
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64
X-CM-TRANSID:_____wD3n9p4dilnuNMTAg--.21464S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF43GrWkGFW7Gw4DWrWDCFg_yoW5Gw1xpa
	y5Ca1ayry3JF4rG3WDtw1q9F1Ykws2k3yUtFy5G340vF1DKF1SkFyrtFy0gFyvya4DAFy2
	qFs8tr9rCayUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UrR6cUUUUU=
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiYxiO3mcpctdgUwAAsz

aGkgTWF1cm86CgoKCgoKPiBJdCBzb3VuZHMgdG8gbWUgdGhhdCB0aGlzIGlzIGFuIGFwcGxpY2F0
aW9uIGJ1Zywgbm90IGEgS2VybmVsIG9uZS4KCgoKPiBXaGF0IGFwcGxpY2F0aW9ucyBoYXZlIHN1
Y2ggYnVnPwoKCgoKCj8/PyBUaGlzIGlzIGEgdGVzdGluZyBhcHBsaWNhdGlvbiBwcm9kdWNlZCBi
eSBhIHRoaXJkLXBhcnR5IGNvbXBhbnksIGFuZCB0aGUgbW9kaWZpY2F0aW9uIGlzIG1haW5seSBh
aW1lZCBhdCBpbXByb3ZpbmcgY29tcGF0aWJpbGl0eS4KCgoKPz8/IEFuZCByZXRhaW5pbmcgbm9k
ZXMgaGFzIG5vIGhhcm0gYW5kIGlzIG1vcmUgc3VpdGFibGUgZm9yIGFwcGxpY2F0aW9uIHNjZW5h
cmlvcy4KCgoKCgoKCgoKLS0tLS0tLS0tLS0tLS0KCgoKCgoKCgoKY2NjMTk0MTAxQDE2My5jb20K
CgoKCgoKCgoKPkVtIE1vbiw/IDQgTm92IDIwMjQgMTA6Mzk6NDcgKzA4MDAKCgoKCgoKCgoKPmNo
ZW5jaGFuZ2NoZW5nIDxjY2MxOTQxMDFAMTYzLmNvbT4gZXNjcmV2ZXU6CgoKCgoKCgoKCj4KCgoK
CgoKCgoKPj4gU29tZSBhcHBsaWNhdGlvbnMgbmVlZCB0byBjaGVjayBpZiB0aGVyZSBpcyBhbiBp
bnB1dCBkZXZpY2Ugb24gdGhlIGNhbWVyYQoKCgoKCgoKCgo+PiBiZWZvcmUgcHJvY2VlZGluZyB0
byB0aGUgbmV4dCBzdGVwLiBXaGVuIHRoZXJlIGlzIG5vIGlucHV0IGRldmljZSwKCgoKCgoKCgoK
Pj4gdGhlIGFwcGxpY2F0aW9uIHdpbGwgcmVwb3J0IGFuIGVycm9yLgoKCgoKCgoKCgo+CgoKCgoK
CgoKCj5OYWNrLgoKCgoKCgoKCgo+CgoKCgoKCgoKCj5JdCBpcyBub3QgbWFuZGF0b3J5IGZvciBW
NEwyIGRldmljZXMgdG8gY3JlYXRlIGlucHV0IGRldmljZXMuCgoKCgoKCgoKCj4KCgoKCgoKCgoK
Pkl0IHNvdW5kcyB0byBtZSB0aGF0IHRoaXMgaXMgYW4gYXBwbGljYXRpb24gYnVnLCBub3QgYSBL
ZXJuZWwgb25lLgoKCgoKCgoKCgo+V2hhdCBhcHBsaWNhdGlvbnMgaGF2ZSBzdWNoIGJ1Zz8KCgoK
CgoKCgoKPgoKCgoKCgoKCgo+PiBDcmVhdGUgaW5wdXQgZGV2aWNlIGZvciBhbGwgdXZjIGRldmlj
ZXMgd2l0aCBzdGF0dXMgZW5kcG9pbnRzLgoKCgoKCgoKCgo+PiBhbmQgb25seSB3aGVuIGJUcmln
Z2VyU3VwcG9ydCBhbmQgYlRyaWdnZXJVc2FnZSBhcmUgb25lIGFyZQoKCgoKCgoKCgo+PiBhbGxv
d2VkIHRvIHJlcG9ydCBjYW1lcmEgYnV0dG9uLgoKCgoKCgoKCgo+CgoKCgoKCgoKCj5QbGVhc2Ug
Zml4IHRoZSBhcHBsaWNhdGlvbiBpbnN0ZWFkLgoKCgoKCgoKCgo+CgoKCgoKCgoKCj4+IAoKCgoK
CgoKCgo+PiBGaXhlczogM2JjMjJkYzY2YTRmICgibWVkaWE6IHV2Y3ZpZGVvOiBPbmx5IGNyZWF0
ZSBpbnB1dCBkZXZzIGlmIGh3IHN1cHBvcnRzIGl0IikKCgoKCgoKCgoKPgoKCgoKCgoKCgo+UmVn
YXJkcywKCgoKCgoKCgoKPk1hdXJvCgoKCgoKCgoKCj4KCgoKCgoKCgoKPj4gU2lnbmVkLW9mZi1i
eTogY2hlbmNoYW5nY2hlbmcgPGNjYzE5NDEwMUAxNjMuY29tPgoKCgoKCgoKCgo+PiAtLS0KCgoK
CgoKCgoKPj4/IGRyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfc3RhdHVzLmMgfCAxMyArKysrKyst
LS0tLS0tCgoKCgoKCgoKCj4+PyAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQoKCgoKCgoKCgo+PiAKCgoKCgoKCgoKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvdXNiL3V2Yy91dmNfc3RhdHVzLmMgYi9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX3N0
YXR1cy5jCgoKCgoKCgoKCj4+IGluZGV4IGE3OGE4OGM3MTBlMi4uMTc3NjQwYzZhODEzIDEwMDY0
NAoKCgoKCgoKCgo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX3N0YXR1cy5jCgoK
CgoKCgoKCj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfc3RhdHVzLmMKCgoKCgoK
CgoKPj4gQEAgLTQ0LDkgKzQ0LDYgQEAgc3RhdGljIGludCB1dmNfaW5wdXRfaW5pdChzdHJ1Y3Qg
dXZjX2RldmljZSAqZGV2KQoKCgoKCgoKCgo+Pj8gCXN0cnVjdCBpbnB1dF9kZXYgKmlucHV0OwoK
CgoKCgoKCgo+Pj8gCWludCByZXQ7CgoKCgoKCgoKCj4+PyAKCgoKCgoKCgoKPj4gLQlpZiAoIXV2
Y19pbnB1dF9oYXNfYnV0dG9uKGRldikpCgoKCgoKCgoKCj4+IC0JCXJldHVybiAwOwoKCgoKCgoK
Cgo+PiAtCgoKCgoKCgoKCj4KCgoKCgoKCgoKPgoKCgoKCgoKCgo+Pj8gCWlucHV0ID0gaW5wdXRf
YWxsb2NhdGVfZGV2aWNlKCk7CgoKCgoKCgoKCj4+PyAJaWYgKGlucHV0ID09IE5VTEwpCgoKCgoK
CgoKCj4+PyAJCXJldHVybiAtRU5PTUVNOwoKCgoKCgoKCgo+PiBAQCAtMTEwLDEwICsxMDcsMTIg
QEAgc3RhdGljIHZvaWQgdXZjX2V2ZW50X3N0cmVhbWluZyhzdHJ1Y3QgdXZjX2RldmljZSAqZGV2
LAoKCgoKCgoKCgo+Pj8gCQlpZiAobGVuIDw9IG9mZnNldG9mKHN0cnVjdCB1dmNfc3RhdHVzLCBz
dHJlYW1pbmcpKQoKCgoKCgoKCgo+Pj8gCQkJcmV0dXJuOwoKCgoKCgoKCgo+Pj8gCgoKCgoKCgoK
Cj4+IC0JCXV2Y19kYmcoZGV2LCBTVEFUVVMsICJCdXR0b24gKGludGYgJXUpICVzIGxlbiAlZFxu
IiwKCgoKCgoKCgoKPj4gLQkJCXN0YXR1cy0+Yk9yaWdpbmF0b3IsCgoKCgoKCgoKCj4+IC0JCQlz
dGF0dXMtPnN0cmVhbWluZy5idXR0b24gPyAicHJlc3NlZCIgOiAicmVsZWFzZWQiLCBsZW4pOwoK
CgoKCgoKCgo+PiAtCQl1dmNfaW5wdXRfcmVwb3J0X2tleShkZXYsIEtFWV9DQU1FUkEsIHN0YXR1
cy0+c3RyZWFtaW5nLmJ1dHRvbik7CgoKCgoKCgoKCj4+ICsJCWlmICh1dmNfaW5wdXRfaGFzX2J1
dHRvbihkZXYpKSB7CgoKCgoKCgoKCj4+ICsJCQl1dmNfZGJnKGRldiwgU1RBVFVTLCAiQnV0dG9u
IChpbnRmICV1KSAlcyBsZW4gJWRcbiIsCgoKCgoKCgoKCj4+ICsJCQkJc3RhdHVzLT5iT3JpZ2lu
YXRvciwKCgoKCgoKCgoKPj4gKwkJCQlzdGF0dXMtPnN0cmVhbWluZy5idXR0b24gPyAicHJlc3Nl
ZCIgOiAicmVsZWFzZWQiLCBsZW4pOwoKCgoKCgoKCgo+PiArCQkJdXZjX2lucHV0X3JlcG9ydF9r
ZXkoZGV2LCBLRVlfQ0FNRVJBLCBzdGF0dXMtPnN0cmVhbWluZy5idXR0b24pOwoKCgoKCgoKCgo+
PiArCQl9CgoKCgoKCgoKCj4+PyAJfSBlbHNlIHsKCgoKCgoKCgoKPj4/IAkJdXZjX2RiZyhkZXYs
IFNUQVRVUywgIlN0cmVhbSAldSBlcnJvciBldmVudCAlMDJ4IGxlbiAlZFxuIiwKCgoKCgoKCgoK
Pj4/IAkJCXN0YXR1cy0+Yk9yaWdpbmF0b3IsIHN0YXR1cy0+YkV2ZW50LCBsZW4pOwoKCgoKCgoK
Cgo+CgoKCgoKCgoKCj4KCgoKCgoKCgoKPgoKCgoKCgoKCgo+VGhhbmtzLAoKCgoKCgoKCgo+TWF1
cm8KCgoKCgoK


