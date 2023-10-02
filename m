Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCBA7B595B
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 19:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238738AbjJBRUk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 13:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238708AbjJBRUj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 13:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A28A4
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 10:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696267191;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PHGPqW0v2zE3keaUh4wfcib7fXMSjlBjFq5UaGl3xEg=;
        b=UxOqoTJ8xUoY+ZemaR1nDndTRN2y0k3IeEvPKY0MxsEeZmiqAWs/dX+lFUQxISrmW9AuCe
        WETm5gMEPKA181gkDuEVCs02jP5+y/4miDxjoQitaNPISym3ceIpK4tvKzuzizxsb9fjCA
        MJ87sXF7DoSjL7KlSo89s2gwWi3c7Rw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-Tp9Aor2EOQmYhAC2t9vIvA-1; Mon, 02 Oct 2023 13:19:16 -0400
X-MC-Unique: Tp9Aor2EOQmYhAC2t9vIvA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9ae12311183so1435359366b.2
        for <linux-media@vger.kernel.org>; Mon, 02 Oct 2023 10:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696267155; x=1696871955;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHGPqW0v2zE3keaUh4wfcib7fXMSjlBjFq5UaGl3xEg=;
        b=OZUUyNz5zSRzWThlwfLRFbymOWbKNt2TSQ6d82jx1hi/BWNEvXADOfYYHL1G1tVVr/
         uhaRzpVJuF/FXabwOpkPAKa/HtYfAtIC/fO4QDyRmzANneHo8OXD8uRgBDx+Jpnh0eA0
         OVcaVRBaW0diQVWJuTckM7vyn6Qs3kBj2tgtD9ZgWgOg/BatkoRZvTkiXXEc0S/OCveW
         JcYNXYaLDbLxSXhgko/BTWZ9DqRU97tvwkltRTIpEnEGWQFFwPYSz88tBZM1AZXEQAo1
         wQCHgtEyrjJdXfye+6MhJMlUx3EiVf6CifTlpJpYdc/AhKwpbjfPFiUI6UgUMfSnrBop
         8P/A==
X-Gm-Message-State: AOJu0Yw6SlzNqRzCqzQTWQjXwwbOHeFEqLnMAEiHh/kEipFpfkOqqlsU
        4c3Frh/jryvMk/VmC7zAOAlxPX+4p+UokMjsb/iRKa/Eyy1/wKZ047iwtkoW0BPSCfo5TOdti3o
        TNFqt50fWFD3YprnTTjVXtYc=
X-Received: by 2002:a17:906:5185:b0:9ae:6da8:1819 with SMTP id y5-20020a170906518500b009ae6da81819mr11903437ejk.48.1696267155110;
        Mon, 02 Oct 2023 10:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaK+suoilVpMJjvvwINS+hOFuXWtesGZjXz8MgHeAy9XXOwjZJF+3KQd0gm0i0vhqNFdRVww==
X-Received: by 2002:a17:906:5185:b0:9ae:6da8:1819 with SMTP id y5-20020a170906518500b009ae6da81819mr11903409ejk.48.1696267154700;
        Mon, 02 Oct 2023 10:19:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id la9-20020a170906ad8900b0098f33157e7dsm17284372ejb.82.2023.10.02.10.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 10:19:13 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------FJybElrY446R8Yy0ycuYO0Xc"
Message-ID: <bc4a6204-6487-9403-243d-6f0a1b20e8ab@redhat.com>
Date:   Mon, 2 Oct 2023 19:19:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
To:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        Claus Stovgaard <claus.stovgaard@gmail.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Cc:     "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
 <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
 <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
 <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
 <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
 <1d03c5f9-1813-40f0-f280-520e2da38e09@hansg.org>
 <1d46186b-24a6-3ae9-ccc1-0ada0f068313@redhat.com>
 <253b5ba6-d44d-4ee1-8c18-44159632d023@redhat.com>
 <DM8PR11MB565393F11EDB68BB5784661C99E9A@DM8PR11MB5653.namprd11.prod.outlook.com>
Content-Language: en-US, nl
In-Reply-To: <DM8PR11MB565393F11EDB68BB5784661C99E9A@DM8PR11MB5653.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------FJybElrY446R8Yy0ycuYO0Xc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/4/23 05:13, Cao, Bingbu wrote:
> Hans,
> 
> Thanks for your test and report.
> 
> I have made some changes locally which will support the latest
> v4l2-async APIs, I will also add the fix for this issue and merge
> them in v3.

I have been trying to make rawbayer capture with the mainline isys code
work in libcamera and I have hit several short comings in the ipu6-isys
code. I have attached 3 patches to fix various issues please integrate
these into the next version of this series.

Talking about the next version of this series, I think it would be
good to post a new version soon ?

Regards,

Hans

--------------FJybElrY446R8Yy0ycuYO0Xc
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-intel-ipu6-Add-mbus-code-filtering-to-isys-dev.patch"
Content-Disposition: attachment;
 filename*0="0001-media-intel-ipu6-Add-mbus-code-filtering-to-isys-dev.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAxNGY0MmZkMzA3MWE3YWJhOGI4M2I5ODgwMmNhM2I0MTM3OTQyOTZkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBNb24sIDIgT2N0IDIwMjMgMTY6Mzc6MTEgKzAyMDAKU3ViamVjdDogW1BB
VENIIDEvM10gbWVkaWE6IGludGVsL2lwdTY6IEFkZCBtYnVzIGNvZGUgZmlsdGVyaW5nIHRv
IGlzeXMKIC9kZXYvdmlkZW8gZW51bV9mbXQKCkFkZCBtYnVzIGNvZGUgZmlsdGVyaW5nIHRv
IGlwdTZfaXN5c192aWRpb2NfZW51bV9mbXQoKS4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUg
R29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogLi4uL21lZGlhL3BjaS9pbnRlbC9p
cHU2L2lwdTYtaXN5cy12aWRlby5jICAgIHwgMjkgKysrKysrKysrKysrKysrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMtdmlkZW8uYyBi
L2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1pc3lzLXZpZGVvLmMKaW5kZXgg
ZGMxNjA1NDkxMzUyLi4yMGZkMDNmNmYyMDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEv
cGNpL2ludGVsL2lwdTYvaXB1Ni1pc3lzLXZpZGVvLmMKKysrIGIvZHJpdmVycy9tZWRpYS9w
Y2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMtdmlkZW8uYwpAQCAtMTMwLDE0ICsxMzAsMzEgQEAg
aW50IGlwdTZfaXN5c192aWRpb2NfcXVlcnljYXAoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQg
KmZoLAogaW50IGlwdTZfaXN5c192aWRpb2NfZW51bV9mbXQoc3RydWN0IGZpbGUgKmZpbGUs
IHZvaWQgKmZoLAogCQkJICAgICAgc3RydWN0IHY0bDJfZm10ZGVzYyAqZikKIHsKLQlpZiAo
Zi0+aW5kZXggPj0gQVJSQVlfU0laRShpcHU2X2lzeXNfcGZtdHMpKQotCQlyZXR1cm4gLUVJ
TlZBTDsKKwl1bnNpZ25lZCBpbnQgaSwgZm91bmQgPSAwOwogCi0JZi0+ZmxhZ3MgPSAwOwot
CWYtPnBpeGVsZm9ybWF0ID0gaXB1Nl9pc3lzX3BmbXRzW2YtPmluZGV4XS5waXhlbGZvcm1h
dDsKLQlmLT5tYnVzX2NvZGUgPSBpcHU2X2lzeXNfcGZtdHNbZi0+aW5kZXhdLmNvZGU7CisJ
aWYgKCFmLT5tYnVzX2NvZGUpIHsKKwkJaWYgKGYtPmluZGV4ID49IEFSUkFZX1NJWkUoaXB1
Nl9pc3lzX3BmbXRzKSkKKwkJCXJldHVybiAtRUlOVkFMOwogCi0JcmV0dXJuIDA7CisJCWYt
PmZsYWdzID0gMDsKKwkJZi0+cGl4ZWxmb3JtYXQgPSBpcHU2X2lzeXNfcGZtdHNbZi0+aW5k
ZXhdLnBpeGVsZm9ybWF0OworCQlmLT5tYnVzX2NvZGUgPSBpcHU2X2lzeXNfcGZtdHNbZi0+
aW5kZXhdLmNvZGU7CisJfQorCisJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoaXB1Nl9p
c3lzX3BmbXRzKTsgaSsrKSB7CisJCWlmIChmLT5tYnVzX2NvZGUgIT0gaXB1Nl9pc3lzX3Bm
bXRzW2ldLmNvZGUpCisJCQljb250aW51ZTsKKworCQlpZiAoZi0+aW5kZXggPT0gZm91bmQp
IHsKKwkJCWYtPmZsYWdzID0gMDsKKwkJCWYtPnBpeGVsZm9ybWF0ID0gaXB1Nl9pc3lzX3Bm
bXRzW2ldLnBpeGVsZm9ybWF0OworCQkJcmV0dXJuIDA7CisJCX0KKworCQlmb3VuZCsrOwor
CX0KKworCXJldHVybiAtRUlOVkFMOwogfQogCiBzdGF0aWMgaW50IHZpZGlvY19nX2ZtdF92
aWRfY2FwX21wbGFuZShzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqZmgsCi0tIAoyLjQxLjAK
Cg==
--------------FJybElrY446R8Yy0ycuYO0Xc
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-media-intel-ipu6-Implement-g_enum_framesizes-for-isy.patch"
Content-Disposition: attachment;
 filename*0="0002-media-intel-ipu6-Implement-g_enum_framesizes-for-isy.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA4MjUwZDJjM2ZkMWMyYWI4M2RlYmNjYTgwYjQ5NDdkM2I5ZDQxMGY3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBNb24sIDIgT2N0IDIwMjMgMTc6MDI6MDYgKzAyMDAKU3ViamVjdDogW1BB
VENIIDIvM10gbWVkaWE6IGludGVsL2lwdTY6IEltcGxlbWVudCBnX2VudW1fZnJhbWVzaXpl
cyBmb3IgaXN5cwogL2Rldi92aWRlbyMgbm9kZXMKCkltcGxlbWVudCBnX2VudW1fZnJhbWVz
aXplcyBmb3IgaXN5cyAvZGV2L3ZpZGVvIyBub2Rlcy4KClNpZ25lZC1vZmYtYnk6IEhhbnMg
ZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9tZWRpYS9wY2kv
aW50ZWwvaXB1Ni9pcHU2LWlzeXMtdmlkZW8uYyB8IDE4ICsrKysrKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtaXN5cy12aWRlby5jIGIvZHJpdmVycy9tZWRp
YS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMtdmlkZW8uYwppbmRleCAyMGZkMDNmNmYyMDQu
LmFkNzRhMTk1MjdiNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1
Ni9pcHU2LWlzeXMtdmlkZW8uYworKysgYi9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2
L2lwdTYtaXN5cy12aWRlby5jCkBAIC0xNTcsNiArMTU3LDIzIEBAIGludCBpcHU2X2lzeXNf
dmlkaW9jX2VudW1fZm10KHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpmaCwKIAlyZXR1cm4g
LUVJTlZBTDsKIH0KIAorc3RhdGljIGludCBpcHU2X2lzeXNfdmlkaW9jX2dfZW51bV9mcmFt
ZXNpemVzKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpmaCwKKwkJCQkJICAgICAgc3RydWN0
IHY0bDJfZnJtc2l6ZWVudW0gKmZzaXplKQoreworCWlmIChmc2l6ZS0+aW5kZXggPiAwKQor
CQlyZXR1cm4gLUVJTlZBTDsKKworCWZzaXplLT50eXBlID0gVjRMMl9GUk1TSVpFX1RZUEVf
Q09OVElOVU9VUzsKKwlmc2l6ZS0+c3RlcHdpc2UubWluX3dpZHRoID0gSVBVNl9JU1lTX01J
Tl9XSURUSDsKKwlmc2l6ZS0+c3RlcHdpc2UubWF4X3dpZHRoID0gSVBVNl9JU1lTX01BWF9X
SURUSDsKKwlmc2l6ZS0+c3RlcHdpc2UubWluX2hlaWdodCA9IElQVTZfSVNZU19NSU5fSEVJ
R0hUOworCWZzaXplLT5zdGVwd2lzZS5tYXhfaGVpZ2h0ID0gSVBVNl9JU1lTX01BWF9IRUlH
SFQ7CisJZnNpemUtPnN0ZXB3aXNlLnN0ZXBfd2lkdGggPSAxOworCWZzaXplLT5zdGVwd2lz
ZS5zdGVwX2hlaWdodCA9IDE7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGludCB2aWRp
b2NfZ19mbXRfdmlkX2NhcF9tcGxhbmUoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKmZoLAog
CQkJCSAgICAgICBzdHJ1Y3QgdjRsMl9mb3JtYXQgKmZtdCkKIHsKQEAgLTk4Nyw2ICsxMDA0
LDcgQEAgaW50IGlwdTZfaXN5c192aWRlb19zZXRfc3RyZWFtaW5nKHN0cnVjdCBpcHU2X2lz
eXNfdmlkZW8gKmF2LCBpbnQgc3RhdGUsCiBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfaW9j
dGxfb3BzIGlvY3RsX29wc19tcGxhbmUgPSB7CiAJLnZpZGlvY19xdWVyeWNhcCA9IGlwdTZf
aXN5c192aWRpb2NfcXVlcnljYXAsCiAJLnZpZGlvY19lbnVtX2ZtdF92aWRfY2FwID0gaXB1
Nl9pc3lzX3ZpZGlvY19lbnVtX2ZtdCwKKwkudmlkaW9jX2VudW1fZnJhbWVzaXplcyA9IGlw
dTZfaXN5c192aWRpb2NfZ19lbnVtX2ZyYW1lc2l6ZXMsCiAJLnZpZGlvY19nX2ZtdF92aWRf
Y2FwX21wbGFuZSA9IHZpZGlvY19nX2ZtdF92aWRfY2FwX21wbGFuZSwKIAkudmlkaW9jX3Nf
Zm10X3ZpZF9jYXBfbXBsYW5lID0gdmlkaW9jX3NfZm10X3ZpZF9jYXBfbXBsYW5lLAogCS52
aWRpb2NfdHJ5X2ZtdF92aWRfY2FwX21wbGFuZSA9IHZpZGlvY190cnlfZm10X3ZpZF9jYXBf
bXBsYW5lLAotLSAKMi40MS4wCgo=
--------------FJybElrY446R8Yy0ycuYO0Xc
Content-Type: text/x-patch; charset=UTF-8;
 name="0003-media-intel-ipu6-Set-V4L2_CAP_IO_MC-flag-for-isys-de.patch"
Content-Disposition: attachment;
 filename*0="0003-media-intel-ipu6-Set-V4L2_CAP_IO_MC-flag-for-isys-de.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBiNWRiOTRiYmQxNDc3MTE4ODU5ODZjMWY2ZTQ2ZjU5ZmRjYTEwZDNjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBNb24sIDIgT2N0IDIwMjMgMTY6MDU6MzUgKzAyMDAKU3ViamVjdDogW1BB
VENIIDMvM10gbWVkaWE6IGludGVsL2lwdTY6IFNldCBWNEwyX0NBUF9JT19NQyBmbGFnIGZv
ciBpc3lzCiAvZGV2L3ZpZGVvIyBub2RlcwoKVGhlIElQVTYgaXN5cyBpcyBhIG1lZGlhLWNv
bnRyb2xsZXIgY2VudHJpYyBkZXZpY2Ugd2hpY2ggbmVlZHMKdGhlIHBpcGVsaW5lIHRvIGJl
IGNvbmZpZ3VyZWQgdXNpbmcgdGhlIG1lZGlhIGNvbnRyb2xsZXIgQVBJIGJlZm9yZSB1c2Uu
CgpTZXQgdGhlIFY0TDJfQ0FQX0lPX01DIGZsYWcgdG8gcmVmbGVjdCB0aGlzLgoKVGhpcyBh
bHNvIGFsbG93cyBkcm9wcGluZyBvZiB0aGUgZW51bV9pbnB1dCgpIGdfaW5wdXQoKSBhbmQg
c19pbnB1dCgpCmltcGxlbWVudGF0aW9ucywgd2l0aCBWNEwyX0NBUF9JT19NQyBzZXQgdGhl
IHY0bDItY29yZSB3aWxsIHRha2UgY2FyZQpvZiB0aG9zZS4KClNpZ25lZC1vZmYtYnk6IEhh
bnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogLi4uL21lZGlhL3BjaS9p
bnRlbC9pcHU2L2lwdTYtaXN5cy12aWRlby5jICAgIHwgMjkgKystLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMtdmlk
ZW8uYyBiL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1pc3lzLXZpZGVvLmMK
aW5kZXggYWQ3NGExOTUyN2I3Li5lNmZjMzI2MDNjM2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1pc3lzLXZpZGVvLmMKKysrIGIvZHJpdmVycy9t
ZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMtdmlkZW8uYwpAQCAtMjYyLDI5ICsyNjIs
NiBAQCBzdGF0aWMgaW50IHZpZGlvY190cnlfZm10X3ZpZF9jYXBfbXBsYW5lKHN0cnVjdCBm
aWxlICpmaWxlLCB2b2lkICpmaCwKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCB2aWRp
b2NfZW51bV9pbnB1dChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqZmgsCi0JCQkgICAgIHN0
cnVjdCB2NGwyX2lucHV0ICppbnB1dCkKLXsKLQlpZiAoaW5wdXQtPmluZGV4ID4gMCkKLQkJ
cmV0dXJuIC1FSU5WQUw7Ci0Jc3Ryc2NweShpbnB1dC0+bmFtZSwgImNhbWVyYSIsIHNpemVv
ZihpbnB1dC0+bmFtZSkpOwotCWlucHV0LT50eXBlID0gVjRMMl9JTlBVVF9UWVBFX0NBTUVS
QTsKLQotCXJldHVybiAwOwotfQotCi1zdGF0aWMgaW50IHZpZGlvY19nX2lucHV0KHN0cnVj
dCBmaWxlICpmaWxlLCB2b2lkICpmaCwgdW5zaWduZWQgaW50ICppbnB1dCkKLXsKLQkqaW5w
dXQgPSAwOwotCi0JcmV0dXJuIDA7Ci19Ci0KLXN0YXRpYyBpbnQgdmlkaW9jX3NfaW5wdXQo
c3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKmZoLCB1bnNpZ25lZCBpbnQgaW5wdXQpCi17Ci0J
cmV0dXJuIGlucHV0ID09IDAgPyAwIDogLUVJTlZBTDsKLX0KLQogc3RhdGljIGludCBsaW5r
X3ZhbGlkYXRlKHN0cnVjdCBtZWRpYV9saW5rICpsaW5rKQogewogCXN0cnVjdCBpcHU2X2lz
eXNfdmlkZW8gKmF2ID0KQEAgLTEwMTcsOSArOTk0LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCB2NGwyX2lvY3RsX29wcyBpb2N0bF9vcHNfbXBsYW5lID0gewogCS52aWRpb2Nfc3RyZWFt
b24gPSB2YjJfaW9jdGxfc3RyZWFtb24sCiAJLnZpZGlvY19zdHJlYW1vZmYgPSB2YjJfaW9j
dGxfc3RyZWFtb2ZmLAogCS52aWRpb2NfZXhwYnVmID0gdmIyX2lvY3RsX2V4cGJ1ZiwKLQku
dmlkaW9jX2VudW1faW5wdXQgPSB2aWRpb2NfZW51bV9pbnB1dCwKLQkudmlkaW9jX2dfaW5w
dXQgPSB2aWRpb2NfZ19pbnB1dCwKLQkudmlkaW9jX3NfaW5wdXQgPSB2aWRpb2Nfc19pbnB1
dCwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVkaWFfZW50aXR5X29wZXJhdGlvbnMg
ZW50aXR5X29wcyA9IHsKQEAgLTEyMTcsNyArMTE5MSw4IEBAIGludCBpcHU2X2lzeXNfdmlk
ZW9faW5pdChzdHJ1Y3QgaXB1Nl9pc3lzX3ZpZGVvICphdikKIAogCW11dGV4X2luaXQoJmF2
LT5tdXRleCk7CiAJYXYtPnZkZXYuZGV2aWNlX2NhcHMgPSBWNEwyX0NBUF9TVFJFQU1JTkcg
fAotCQkJICAgICAgIFY0TDJfQ0FQX1ZJREVPX0NBUFRVUkVfTVBMQU5FOworCQkJICAgICAg
IFY0TDJfQ0FQX1ZJREVPX0NBUFRVUkVfTVBMQU5FIHwKKwkJCSAgICAgICBWNEwyX0NBUF9J
T19NQzsKIAlhdi0+dmRldi52ZmxfZGlyID0gVkZMX0RJUl9SWDsKIAogCXJldCA9IGlwdTZf
aXN5c19xdWV1ZV9pbml0KCZhdi0+YXEpOwotLSAKMi40MS4wCgo=

--------------FJybElrY446R8Yy0ycuYO0Xc--

