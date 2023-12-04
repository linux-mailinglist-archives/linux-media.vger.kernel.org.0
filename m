Return-Path: <linux-media+bounces-1614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB78803A5F
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 17:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25A972810D4
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 16:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2004F2E626;
	Mon,  4 Dec 2023 16:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PxBF/RRu"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21A3D5
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 08:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701707726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fEQrIUvvB0ZHrmUoOwDMHpHhUKTAQCdSNLvdtY6Yjqw=;
	b=PxBF/RRuJmGPY8HLM1DDBIyWAXVahkpybZIKZSvCgP1rV5saCxM/kP8cMsOZSb6xQJD+GX
	sXDvckRye6r3e3tfxZwIQBJKRkkHd8b1KrWhJF15/m2zCbIJOxsWnrf/zJpOhviqJlEgcO
	joxf1xOoZPEVX8Fqrw2wAOokBriJ0IY=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-weNYAKyTMT28myeuSUXgXQ-1; Mon, 04 Dec 2023 11:35:20 -0500
X-MC-Unique: weNYAKyTMT28myeuSUXgXQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-50bf07e91b7so1086707e87.0
        for <linux-media@vger.kernel.org>; Mon, 04 Dec 2023 08:35:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701707718; x=1702312518;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fEQrIUvvB0ZHrmUoOwDMHpHhUKTAQCdSNLvdtY6Yjqw=;
        b=F/EbrKhc7YwHYHx+EG8co5TrEqjUiv56cie7axrphhYHY/AUTA/qUjJkiRKSG+3d1x
         9UTt3pjc2gPnWeI+1HCxxBEOywFqo4QWNcdmNhWZdoM4oP/XDoKgNwRBRqjQLygnKhi/
         ZIUtBd3o8w9AD4ZDcUueh4YXodvsuoEEPL7DbUiZTo4TSWNYi26ICBJhocsK7PmvORxS
         YpikEnMPj/WpOWo3SmQtjKEGLcyzxbzgzCVZ1QEJWe+eY7jbo6jcYk8kgm3iPmX/g+l5
         00mLFern3BG9ypYX6eFdXWe4barPbk8G3hcyUsQaUia4Ve9sIW/pM7YSICsEwdfIKBBB
         Yq7Q==
X-Gm-Message-State: AOJu0YyMW3gJYa8abHS1pkMCV05cKNOQQ0Mh0KBicU1eUHhsgKuUlFpL
	Lp5N8Itb2mdztwvLcSbI5anNIjcUH1In/S6G7rE4wNAxNEtiEzLgxumPxwMu/xft+MkjNB6QqNP
	UXP6ah44Ak87UoVoheXP+hVZ5n6Svhqc=
X-Received: by 2002:ac2:4101:0:b0:50b:d763:fe43 with SMTP id b1-20020ac24101000000b0050bd763fe43mr2721650lfi.94.1701707718488;
        Mon, 04 Dec 2023 08:35:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlLKJuJtmVyLXHDtYOMRP2bxFGra6iPBTaNikqLRB+AD7efzplfFvncX/wQzCfDNUXLNRi5Q==
X-Received: by 2002:ac2:4101:0:b0:50b:d763:fe43 with SMTP id b1-20020ac24101000000b0050bd763fe43mr2721631lfi.94.1701707718137;
        Mon, 04 Dec 2023 08:35:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v25-20020a509559000000b0054cacb41abasm2081677eda.60.2023.12.04.08.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 08:35:17 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------tPbU0VzV79v7PNh0ewqBtP95"
Message-ID: <4768df6c-3b2d-4bca-afcd-553a272dc9fd@redhat.com>
Date: Mon, 4 Dec 2023 17:35:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 "Martti Groenen (19174837)" <M.Groenen@student.hhs.nl>
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
 claus.stovgaard@gmail.com, tfiga@chromium.org, senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>
Content-Language: en-US, nl
In-Reply-To: <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>

This is a multi-part message in MIME format.
--------------tPbU0VzV79v7PNh0ewqBtP95
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/8/23 12:59, Hans de Goede wrote:
> Hi Bingbu,
> 
> On 10/24/23 13:29, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> This patch series adds a driver for Intel IPU6 input system.
>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
>> device which can be found in some Intel Client Platforms. User can use
>> IPU6 to capture images from MIPI camera sensors.
>>
>> IPU6 has its own firmware which exposes ABIs to driver, and communicates
>> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
>> the driver sets up a page table to allow IPU6 DMA to access the system
>> memory.
>>
>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
> 
> I have been testing this on a TigerLake system, a Dell Latitude 9420
> with ov01a1s and the packed 10 bit bayer pixel fmt: V4L2_PIX_FMT_SGRBG10P,
> which libcamera together with (WIP) software debayer support picks
> by default does not work. There are many many CSI errors in dmesg
> and only the first 10 or so lines of the image show.
> 
> Disabling the packed format by removing it from ipu6_isys_pfmts[],
> making libcamera pick the unpacked (every 10 bits per pixel data
> stored in a 16 bit word in output buffer) fixes this.
> 
> Are the packed bayer formats supposed to work on Tiger Lake, or
> is this a known issue which Intel's own userspace stack avoids
> by always picking the unpacked format ?

I have just rebased my personal tree with these patches in it
on top of media_staging. I had to make some changes to make
this series work on top of media_staging.

I'm attaching these changes here as a patch in case they
are useful for someone else. Feel free to squash these
into the next version.

Talking about a next version I would think it is about
time to post a v3 of this ?

--------------tPbU0VzV79v7PNh0ewqBtP95
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-ipu6-Add-support-for-kernel-6.8.patch"
Content-Disposition: attachment;
 filename="0001-media-ipu6-Add-support-for-kernel-6.8.patch"
Content-Transfer-Encoding: base64

RnJvbSA5M2QyM2UzNDZhYWEyZTJiYTU5YjRiYzk1Y2EwMjliNjc0ZTAxMTk1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBNb24sIDQgRGVjIDIwMjMgMTI6MTM6MDIgKzAxMDAKU3ViamVjdDogW1BB
VENIXSBtZWRpYTogaXB1NjogQWRkIHN1cHBvcnQgZm9yIGtlcm5lbCA2LjgKCkFkZCBzdXBw
b3J0IGZvciB0aGUgdXBjb21pbmcgdjRsMi1zdWJkZXYgQVBJIGNoYW5nZXMgaW4ga2VybmVs
IDYuOC4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5j
b20+Ci0tLQogZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMtY3NpMi5j
IHwgIDggKysrLS0tLS0KIC4uLi9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMtc3Vi
ZGV2LmMgICB8IDE5ICsrKysrKysrKysrLS0tLS0tLS0KIC4uLi9tZWRpYS9wY2kvaW50ZWwv
aXB1Ni9pcHU2LWlzeXMtc3ViZGV2LmggICB8ICAyIC0tCiAuLi4vbWVkaWEvcGNpL2ludGVs
L2lwdTYvaXB1Ni1pc3lzLXZpZGVvLmMgICAgfCAgMyArLS0KIDQgZmlsZXMgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMtY3NpMi5jIGIvZHJpdmVycy9tZWRp
YS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMtY3NpMi5jCmluZGV4IDJkYTgyYTc0ZmQxOC4u
MWQ0MGJmYTk5MmE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2
L2lwdTYtaXN5cy1jc2kyLmMKKysrIGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9p
cHU2LWlzeXMtY3NpMi5jCkBAIC0zODYsMTIgKzM4NiwxMSBAQCBzdGF0aWMgaW50IGlwdTZf
aXN5c19jc2kyX3NldF9zZWwoc3RydWN0IHY0bDJfc3ViZGV2ICpzZCwKIAlpZiAoIXNpbmtf
ZmZtdCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQlzcmNfZmZtdCA9IHY0bDJfc3ViZGV2X3N0
YXRlX2dldF9zdHJlYW1fZm9ybWF0KHN0YXRlLCBzZWwtPnBhZCwKLQkJCQkJCSAgICAgICBz
ZWwtPnN0cmVhbSk7CisJc3JjX2ZmbXQgPSB2NGwyX3N1YmRldl9zdGF0ZV9nZXRfZm9ybWF0
KHN0YXRlLCBzZWwtPnBhZCwgc2VsLT5zdHJlYW0pOwogCWlmICghc3JjX2ZmbXQpCiAJCXJl
dHVybiAtRUlOVkFMOwogCi0JY3JvcCA9IHY0bDJfc3ViZGV2X3N0YXRlX2dldF9zdHJlYW1f
Y3JvcChzdGF0ZSwgc2VsLT5wYWQsIHNlbC0+c3RyZWFtKTsKKwljcm9wID0gdjRsMl9zdWJk
ZXZfc3RhdGVfZ2V0X2Nyb3Aoc3RhdGUsIHNlbC0+cGFkLCBzZWwtPnN0cmVhbSk7CiAJaWYg
KCFjcm9wKQogCQlyZXR1cm4gLUVJTlZBTDsKIApAQCAtNDM2LDcgKzQzNSw3IEBAIHN0YXRp
YyBpbnQgaXB1Nl9pc3lzX2NzaTJfZ2V0X3NlbChzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLAog
CWlmICghc2lua19mZm10KQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCWNyb3AgPSB2NGwyX3N1
YmRldl9zdGF0ZV9nZXRfc3RyZWFtX2Nyb3Aoc3RhdGUsIHNlbC0+cGFkLCBzZWwtPnN0cmVh
bSk7CisJY3JvcCA9IHY0bDJfc3ViZGV2X3N0YXRlX2dldF9jcm9wKHN0YXRlLCBzZWwtPnBh
ZCwgc2VsLT5zdHJlYW0pOwogCWlmICghY3JvcCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAg
LTQ2Myw3ICs0NjIsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfc3ViZGV2X3ZpZGVv
X29wcyBjc2kyX3NkX3ZpZGVvX29wcyA9IHsKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
djRsMl9zdWJkZXZfcGFkX29wcyBjc2kyX3NkX3BhZF9vcHMgPSB7Ci0JLmluaXRfY2ZnID0g
aXB1Nl9pc3lzX3N1YmRldl9pbml0X2NmZywKIAkuZ2V0X2ZtdCA9IHY0bDJfc3ViZGV2X2dl
dF9mbXQsCiAJLnNldF9mbXQgPSBpcHU2X2lzeXNfc3ViZGV2X3NldF9mbXQsCiAJLmdldF9z
ZWxlY3Rpb24gPSBpcHU2X2lzeXNfY3NpMl9nZXRfc2VsLApkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMtc3ViZGV2LmMgYi9kcml2ZXJzL21l
ZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtaXN5cy1zdWJkZXYuYwppbmRleCA3ZjEwNDIwNWQx
NTMuLjU5OGJkZjY5YjM2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwv
aXB1Ni9pcHU2LWlzeXMtc3ViZGV2LmMKKysrIGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwv
aXB1Ni9pcHU2LWlzeXMtc3ViZGV2LmMKQEAgLTE0Myw4ICsxNDMsNyBAQCBpbnQgaXB1Nl9p
c3lzX3N1YmRldl9zZXRfZm10KHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsCiAJZm9ybWF0LT5m
b3JtYXQuZmllbGQgPSBWNEwyX0ZJRUxEX05PTkU7CiAKIAkvKiBTdG9yZSB0aGUgZm9ybWF0
IGFuZCBwcm9wYWdhdGUgaXQgdG8gdGhlIHNvdXJjZSBwYWQuICovCi0JZm10ID0gdjRsMl9z
dWJkZXZfc3RhdGVfZ2V0X3N0cmVhbV9mb3JtYXQoc3RhdGUsIGZvcm1hdC0+cGFkLAotCQkJ
CQkJICBmb3JtYXQtPnN0cmVhbSk7CisJZm10ID0gdjRsMl9zdWJkZXZfc3RhdGVfZ2V0X2Zv
cm1hdChzdGF0ZSwgZm9ybWF0LT5wYWQsIGZvcm1hdC0+c3RyZWFtKTsKIAlpZiAoIWZtdCkK
IAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAgLTE2OSw4ICsxNjgsNyBAQCBpbnQgaXB1Nl9pc3lz
X3N1YmRldl9zZXRfZm10KHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsCiAJaWYgKHJldCkKIAkJ
cmV0dXJuIC1FSU5WQUw7CiAKLQljcm9wID0gdjRsMl9zdWJkZXZfc3RhdGVfZ2V0X3N0cmVh
bV9jcm9wKHN0YXRlLCBvdGhlcl9wYWQsCi0JCQkJCQkgb3RoZXJfc3RyZWFtKTsKKwljcm9w
ID0gdjRsMl9zdWJkZXZfc3RhdGVfZ2V0X2Nyb3Aoc3RhdGUsIG90aGVyX3BhZCwgb3RoZXJf
c3RyZWFtKTsKIAkvKiByZXNldCBjcm9wICovCiAJY3JvcC0+bGVmdCA9IDA7CiAJY3JvcC0+
dG9wID0gMDsKQEAgLTIyOSw3ICsyMjcsNyBAQCBpbnQgaXB1Nl9pc3lzX2dldF9zdHJlYW1f
cGFkX2ZtdChzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLCB1MzIgcGFkLCB1MzIgc3RyZWFtLAog
CQlyZXR1cm4gLUVJTlZBTDsKIAogCXN0YXRlID0gdjRsMl9zdWJkZXZfbG9ja19hbmRfZ2V0
X2FjdGl2ZV9zdGF0ZShzZCk7Ci0JZm10ID0gdjRsMl9zdWJkZXZfc3RhdGVfZ2V0X3N0cmVh
bV9mb3JtYXQoc3RhdGUsIHBhZCwgc3RyZWFtKTsKKwlmbXQgPSB2NGwyX3N1YmRldl9zdGF0
ZV9nZXRfZm9ybWF0KHN0YXRlLCBwYWQsIHN0cmVhbSk7CiAJaWYgKGZtdCkgewogCQkqZm9y
bWF0ID0gKmZtdDsKIAkJcmV0ID0gMDsKQEAgLTI1MCw3ICsyNDgsNyBAQCBpbnQgaXB1Nl9p
c3lzX2dldF9zdHJlYW1fcGFkX2Nyb3Aoc3RydWN0IHY0bDJfc3ViZGV2ICpzZCwgdTMyIHBh
ZCwgdTMyIHN0cmVhbSwKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAlzdGF0ZSA9IHY0bDJfc3Vi
ZGV2X2xvY2tfYW5kX2dldF9hY3RpdmVfc3RhdGUoc2QpOwotCXJlY3QgPSB2NGwyX3N1YmRl
dl9zdGF0ZV9nZXRfc3RyZWFtX2Nyb3Aoc3RhdGUsIHBhZCwgc3RyZWFtKTsKKwlyZWN0ID0g
djRsMl9zdWJkZXZfc3RhdGVfZ2V0X2Nyb3Aoc3RhdGUsIHBhZCwgc3RyZWFtKTsKIAlpZiAo
cmVjdCkgewogCQkqY3JvcCA9ICpyZWN0OwogCQlyZXQgPSAwOwpAQCAtMjg0LDggKzI4Miw4
IEBAIHUzMiBpcHU2X2lzeXNfZ2V0X3NyY19zdHJlYW1fYnlfc3JjX3BhZChzdHJ1Y3QgdjRs
Ml9zdWJkZXYgKnNkLCB1MzIgcGFkKQogCXJldHVybiBzb3VyY2Vfc3RyZWFtOwogfQogCi1p
bnQgaXB1Nl9pc3lzX3N1YmRldl9pbml0X2NmZyhzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLAot
CQkJICAgICAgc3RydWN0IHY0bDJfc3ViZGV2X3N0YXRlICpzdGF0ZSkKK3N0YXRpYyBpbnQg
aXB1Nl9pc3lzX3N1YmRldl9pbml0X3N0YXRlKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsCisJ
CQkJICAgICAgIHN0cnVjdCB2NGwyX3N1YmRldl9zdGF0ZSAqc3RhdGUpCiB7CiAJc3RydWN0
IHY0bDJfc3ViZGV2X3JvdXRlIHJvdXRlID0gewogCQkuc2lua19wYWQgPSAwLApAQCAtMzEw
LDYgKzMwOCwxMCBAQCBpbnQgaXB1Nl9pc3lzX3N1YmRldl9zZXRfcm91dGluZyhzdHJ1Y3Qg
djRsMl9zdWJkZXYgKnNkLAogCXJldHVybiBzdWJkZXZfc2V0X3JvdXRpbmcoc2QsIHN0YXRl
LCByb3V0aW5nKTsKIH0KIAorc3RhdGljIGNvbnN0IHN0cnVjdCB2NGwyX3N1YmRldl9pbnRl
cm5hbF9vcHMgaXB1Nl9pc3lzX3N1YmRldl9pbnRlcm5hbF9vcHMgPSB7CisJLmluaXRfc3Rh
dGUgPSBpcHU2X2lzeXNfc3ViZGV2X2luaXRfc3RhdGUsCit9OworCiBpbnQgaXB1Nl9pc3lz
X3N1YmRldl9pbml0KHN0cnVjdCBpcHU2X2lzeXNfc3ViZGV2ICphc2QsCiAJCQkgIGNvbnN0
IHN0cnVjdCB2NGwyX3N1YmRldl9vcHMgKm9wcywKIAkJCSAgdW5zaWduZWQgaW50IG5yX2N0
cmxzLApAQCAtMzI3LDYgKzMyOSw3IEBAIGludCBpcHU2X2lzeXNfc3ViZGV2X2luaXQoc3Ry
dWN0IGlwdTZfaXN5c19zdWJkZXYgKmFzZCwKIAkJCSBWNEwyX1NVQkRFVl9GTF9TVFJFQU1T
OwogCWFzZC0+c2Qub3duZXIgPSBUSElTX01PRFVMRTsKIAlhc2QtPnNkLmVudGl0eS5mdW5j
dGlvbiA9IE1FRElBX0VOVF9GX1ZJRF9JRl9CUklER0U7CisJYXNkLT5zZC5pbnRlcm5hbF9v
cHMgPSAmaXB1Nl9pc3lzX3N1YmRldl9pbnRlcm5hbF9vcHM7CiAKIAlhc2QtPnBhZCA9IGRl
dm1fa2NhbGxvYygmYXNkLT5pc3lzLT5hZGV2LT5hdXhkZXYuZGV2LCBudW1fcGFkcywKIAkJ
CQlzaXplb2YoKmFzZC0+cGFkKSwgR0ZQX0tFUk5FTCk7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtaXN5cy1zdWJkZXYuaCBiL2RyaXZlcnMvbWVk
aWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1pc3lzLXN1YmRldi5oCmluZGV4IDEzZTJjNTdlZmFl
YS4uZWY3ODcxMDJlZDk4IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9p
cHU2L2lwdTYtaXN5cy1zdWJkZXYuaAorKysgYi9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9p
cHU2L2lwdTYtaXN5cy1zdWJkZXYuaApAQCAtNDMsOCArNDMsNiBAQCBpbnQgaXB1Nl9pc3lz
X2dldF9zdHJlYW1fcGFkX2ZtdChzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLCB1MzIgcGFkLCB1
MzIgc3RyZWFtLAogCQkJCSBzdHJ1Y3QgdjRsMl9tYnVzX2ZyYW1lZm10ICpmb3JtYXQpOwog
aW50IGlwdTZfaXN5c19nZXRfc3RyZWFtX3BhZF9jcm9wKHN0cnVjdCB2NGwyX3N1YmRldiAq
c2QsIHUzMiBwYWQsIHUzMiBzdHJlYW0sCiAJCQkJICBzdHJ1Y3QgdjRsMl9yZWN0ICpjcm9w
KTsKLWludCBpcHU2X2lzeXNfc3ViZGV2X2luaXRfY2ZnKHN0cnVjdCB2NGwyX3N1YmRldiAq
c2QsCi0JCQkgICAgICBzdHJ1Y3QgdjRsMl9zdWJkZXZfc3RhdGUgKnN0YXRlKTsKIGludCBp
cHU2X2lzeXNfc3ViZGV2X3NldF9yb3V0aW5nKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsCiAJ
CQkJIHN0cnVjdCB2NGwyX3N1YmRldl9zdGF0ZSAqc3RhdGUsCiAJCQkJIGVudW0gdjRsMl9z
dWJkZXZfZm9ybWF0X3doZW5jZSB3aGljaCwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
cGNpL2ludGVsL2lwdTYvaXB1Ni1pc3lzLXZpZGVvLmMgYi9kcml2ZXJzL21lZGlhL3BjaS9p
bnRlbC9pcHU2L2lwdTYtaXN5cy12aWRlby5jCmluZGV4IGU3M2E0NmViN2ZkMy4uZGMxZGFi
NzEzYmI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYt
aXN5cy12aWRlby5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1p
c3lzLXZpZGVvLmMKQEAgLTI4MSw4ICsyODEsNyBAQCBzdGF0aWMgaW50IGxpbmtfdmFsaWRh
dGUoc3RydWN0IG1lZGlhX2xpbmsgKmxpbmspCiAKIAl2NGwyX3N1YmRldl9sb2NrX3N0YXRl
KHNfc3RhdGUpOwogCi0Jc19mbXQgPSB2NGwyX3N1YmRldl9zdGF0ZV9nZXRfc3RyZWFtX2Zv
cm1hdChzX3N0YXRlLCBzX3BhZC0+aW5kZXgsCi0JCQkJCQkgICAgc19zdHJlYW0pOworCXNf
Zm10ID0gdjRsMl9zdWJkZXZfc3RhdGVfZ2V0X2Zvcm1hdChzX3N0YXRlLCBzX3BhZC0+aW5k
ZXgsIHNfc3RyZWFtKTsKIAlpZiAoIXNfZm10KSB7CiAJCWRldl9lcnIoZGV2LCAiZmFpbGVk
IHRvIGdldCBzb3VyY2UgcGFkIGZvcm1hdFxuIik7CiAJCWdvdG8gdW5sb2NrOwotLSAKMi40
MS4wCgo=

--------------tPbU0VzV79v7PNh0ewqBtP95--


