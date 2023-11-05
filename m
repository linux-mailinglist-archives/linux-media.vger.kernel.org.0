Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 635DC7E155D
	for <lists+linux-media@lfdr.de>; Sun,  5 Nov 2023 17:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjKEQ7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Nov 2023 11:59:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjKEQ7q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Nov 2023 11:59:46 -0500
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF0CBB
        for <linux-media@vger.kernel.org>; Sun,  5 Nov 2023 08:59:42 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mx.kolabnow.com (Postfix) with ESMTP id 6F9AB20B366C;
        Sun,  5 Nov 2023 17:59:39 +0100 (CET)
Authentication-Results: ext-mx-out011.mykolab.com (amavis);
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        in-reply-to:from:from:content-language:references:subject
        :subject:mime-version:date:date:message-id:content-type
        :content-type:received:received:received; s=dkim20160331; t=
        1699203578; x=1701017979; bh=arjyPIgNxx0nasQ6UODKkdKU4iKWTHG+nES
        yiIG/rgg=; b=MYOyHX9nXYaEbZS3Mhgni/5hcoN+/ARGDPCcnH4w8xeiQ1yWXtS
        YCtK5FKkmvIUWUidVVLZ0jKxSV8TuYcWiYSW8her0L4RyQfeY+tCIKC3oWaiBMRT
        uC2b4QUyJg1bxcO/SsLjItqA+qWn3hzGrRtafpgv974YswQc2tj3F7tN5DOfM7Jr
        N6H6eHmMURNzwoP0QhODQ2jiOUXbtE5VGRPRNSxU5Fz3HcH56T5sE+Tu3XVZl7Y8
        XZVxXC01CkZmhC/n/PsL4QPmvEbyWvtKRsHm0Ce8eEebiPSzIkLnxuh2DKyeF5Ya
        8n0vuqvE7wdO7VI9HzOLyMMvbJ2qJ9U4gYEq/1Ro7Chk6WhlS0+CWcvGizNd/9ks
        ydocv+2y+F30ec6rzlZgEpzK9Zd0f9QZICiqMGWM30zewIbCe7rAlwM87lkGSS/N
        JWM4oQjPS7/3rr2RHuDJHszbW6B43jp490mv8Fbrf+tfi3Qn6C8nv+9KlEoK/QE6
        0sJoni8EsjF7ppQVMCOmloMsXb/p2xgh3fTaHTffR/Fyk3vLj8MuwVAUUlHS3At5
        bTba/0GOh8rfMHb18+WyNVMWjSV1fJ821qOjaz8atK+WtX21/YcAHtZAXg1O5Wu1
        rDX4OsLWgwqceXagDQqz2BuruHVYpAM/i9UKPRj5SnUHcL1lwlVtGnd8=
X-Virus-Scanned: amavis at mykolab.com
X-Spam-Score: -1
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 9gBCiK67NWjl; Sun,  5 Nov 2023 17:59:38 +0100 (CET)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
        by mx.kolabnow.com (Postfix) with ESMTPS id 6DC4A20B2751;
        Sun,  5 Nov 2023 17:59:35 +0100 (CET)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
        by int-mx009.mykolab.com (Postfix) with ESMTPS id AA49720C7686;
        Sun,  5 Nov 2023 17:59:32 +0100 (CET)
Content-Type: multipart/mixed; boundary="------------D0OE10wapxTR2FrTa5Jt7WiD"
Message-ID: <855f69b8-dc33-225a-ebd3-134467d55cf1@hansg.org>
Date:   Sun, 5 Nov 2023 17:59:31 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 11/15] media: intel/ipu6: input system video capture
 nodes
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-12-bingbu.cao@intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hans@hansg.org>
In-Reply-To: <20231024112924.3934228-12-bingbu.cao@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------D0OE10wapxTR2FrTa5Jt7WiD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bingbu,

On 10/24/23 13:29, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Register v4l2 video device and setup the vb2 queue to
> support basic video capture. Video streaming callback
> will trigger the input system driver to construct a
> input system stream configuration for firmware based on
> data type and stream ID and then queue buffers to firmware
> to do capture.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>

While testing this new version I found a small issue in the enum_fmt implementation caused by the mbus_code filtering support I suggested.

Attached is a single-line patch which fixes this, can you please fold this into the next version ?

Regards,

Hans

--------------D0OE10wapxTR2FrTa5Jt7WiD
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-ipu6-isys-video-Do-not-set-mbus_code-from-vidi.patch"
Content-Disposition: attachment;
 filename*0="0001-media-ipu6-isys-video-Do-not-set-mbus_code-from-vidi.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA0YzNiMTQ0NWY1MWU4MTIzYWMzZmIzZmJmNzZiMmM0MjlhMWM3N2ZhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBTdW4sIDUgTm92IDIwMjMgMTc6NDY6NTIgKzAxMDAKU3ViamVjdDogW1BB
VENIXSBtZWRpYTogaXB1Ni1pc3lzLXZpZGVvOiBEbyBub3Qgc2V0IG1idXNfY29kZSBmcm9t
CiB2aWRpb2NfZW51bV9mbXRfdmlkX2NhcAoKV2hlbiBlbnVtZXJhdGluZyB1c2Vyc3BhY2Ug
d2lsbCBjYWxsIHZpZGlvY19lbnVtX2ZtdF92aWRfY2FwIHJlcGVhdGVkbHkKd2l0aCBoaWdo
ZXIgdjRsMl9mbXRkZXNjLmluZGV4IHZhbHVlcyB1bnRpbCBpdCByZXR1cm5zIC1FSU5WQUwg
dG8KaW5kaWNhdGUgYWxsIGZvcm1hdHMgaGF2ZSBiZWVuIGVudW1lcmF0ZWQuCgpTb21lIHVz
ZXJzcGFjZSBjb2RlIHN1Y2ggYXMgZS5nLiB2NGwyLWN0bCBvbmx5IGZpbGxzIHRoZSB2NGwy
X2ZtdGRlc2MKc3RydWN0IG9uY2UgYW5kIHRoZW4gb25seSBpbmNyZWFzZXMgdjRsMl9mbXRk
ZXNjLmluZGV4IGZvciBzdWJzZXF1ZW50CmNhbGxzLgoKU2V0dGluZyB2NGwyX2ZtdGRlc2Mu
bWJ1c19jb2RlIHdoZW4gaXQgd2FzIDAgY2hhbmdlcyBzdWJzZXF1ZW50CnZpZGlvY19lbnVt
X2ZtdF92aWRfY2FwIGZyb20gdW5maWx0ZXJlZCBtb2RlIHRvIG1idXMtY29kZSBmaWx0ZXJl
ZCBtb2RlCmJyZWFraW5nIHVuZmlsdGVyZWQgZW51bWVyYXRpb24uCgpEbyBub3Qgc2V0IHY0
bDJfZm10ZGVzYy5tYnVzX2NvZGUgaW4gdW5maWx0ZXJlZCBtb2RlIHRvIGZpeCB0aGlzLgoK
U2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0t
CiBkcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtaXN5cy12aWRlby5jIHwgMSAt
CiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1pc3lzLXZpZGVvLmMgYi9kcml2ZXJzL21lZGlh
L3BjaS9pbnRlbC9pcHU2L2lwdTYtaXN5cy12aWRlby5jCmluZGV4IGY4MTkzNGEzMDFiNC4u
ZTczYTQ2ZWI3ZmQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2
L2lwdTYtaXN5cy12aWRlby5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTYv
aXB1Ni1pc3lzLXZpZGVvLmMKQEAgLTEyOSw3ICsxMjksNiBAQCBpbnQgaXB1Nl9pc3lzX3Zp
ZGlvY19lbnVtX2ZtdChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqZmgsCiAJaWYgKCFmLT5t
YnVzX2NvZGUpIHsKIAkJZi0+ZmxhZ3MgPSAwOwogCQlmLT5waXhlbGZvcm1hdCA9IGlwdTZf
aXN5c19wZm10c1tmLT5pbmRleF0ucGl4ZWxmb3JtYXQ7Ci0JCWYtPm1idXNfY29kZSA9IGlw
dTZfaXN5c19wZm10c1tmLT5pbmRleF0uY29kZTsKIAkJcmV0dXJuIDA7CiAJfQogCi0tIAoy
LjQxLjAKCg==

--------------D0OE10wapxTR2FrTa5Jt7WiD--
