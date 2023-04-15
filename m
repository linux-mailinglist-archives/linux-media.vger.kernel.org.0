Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696E86E3361
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 22:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjDOULD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 16:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjDOULB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 16:11:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9E735B1
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 13:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1681589458; i=ps.report@gmx.net;
        bh=xfWh7xyVzKjbQqW50oMRPpJ4oOpr7pqIFDjOqTaUwko=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=ipMXMuzXvUsxECMvzacq2gKsH6Y9CYKnbCu4zm5gQAOhxmpUlek+HWcI6KJpLOIcd
         K5rPBBf/Fpw/idanAKlhl0GIQzgzs5YcEZJ04124w/v+bZUF4fmOg5xjbAYnNqxbOX
         bl4tUAQtHOy0vobzIjumHsNHX6Zq3YFNtrPlXThXbI+XM2HFzMQEj7Bl1tEv84kpAZ
         UODdAW500Un1r2ih41afuZxTfPM1kq++D85GFtICyWGKnH5wphuEttR3WvbYSu73wd
         SEjzx9XpcEzd4/TNB1+FP6ts8Dku483hPXPr9q8h0IB3d1WlDM7+ydLflpY0ZkLuWA
         Ccl+HUQMCLMIA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.95]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMofc-1q6XXa08TU-00ImFH for
 <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 22:10:58 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 05/11] qv4l2: fix Qt6 compile (QHBoxLayout/QVBoxLayout has no member setMargin)
Date:   Sat, 15 Apr 2023 22:10:50 +0200
Message-Id: <20230415201056.31080-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415201056.31080-1-ps.report@gmx.net>
References: <20230415201056.31080-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:KQq7HsJ8BRRlbQsGUVTtxYAh0bX3Mo+t/YhtLZjrH4+0DbHKaxQ
 91VfmDfEF8FPmVwc+dwixta9mDJEF5GH5+iJZTt+e6OLqbh4IG/wQ/noQYYEOcw11/H8fjd
 UsF0l6a96QZMxJw8awKxLivhBhK50PFPyqzGTdOtEm+kY1yQF1eTIFveSGuUSsk3/r7Lixz
 LpczEi5tdNn/gFCyvOz3w==
UI-OutboundReport: notjunk:1;M01:P0:HBgBjr4dIlo=;VKHcOOrZqtC08YYlGfGFkpqOYd9
 TlnrcQSkg0ImIpLlPIctOYr7g2fKpTx2hQfiqaBt5Ct5DOXezhN0rgGE2Bh6mefH1vAmv6YYV
 t3+CvLUtP3VeG2aEzHo0uqp+/p+z/L0q8DDN58IjTbJiI2yAqvTSrT/iB1sO9ySQUPKH9502g
 peKtJgUR6sL5rbHuN8qAzlak9Nav1+qSOXhBMgO2h2pDyYbTNlJRIBA63+OHHbAoLhc4InYYE
 SgGhRhBGPxFZkdLTkzvnUPSWFUB7dvFnPUppaYQ0JM/S9ThteTMrNiXVOE9VDb34mP5IuQ3Gr
 Hwzt5bYWlUSdODiXaRydbnPtlV9cp4dn+TuysK7BuMTKUX8Pp0LvHjANO//q4w/1+hegc/pHR
 MSzkta8kFu2MeXw0Csr/mGb3/8UFYEHCeOok2osCnRlL4So4XppalwBQnwRGcLMUwP0pCPGi+
 IlPEGA1qQTxWo5SjRxfeaCQ2o91tLP91sNFMBHwqtz8UWwRgpXjDcInyjsPN7nMjrnmWczj1n
 5wjljOYlsTfYSMXMRboXwUyQa812RwEDbKjaz5qf+v9J8v2pDjPuCjZU2th1ZR5JnfZApRY+K
 f2u8ef5d83dzrgBDhFFxEXcIcnZe9gj9HYu9mD2jHz5i1Or/FghaWB5CsY7tsVmbxJ1/CUOyf
 jDlUQ5+JSXDCMR7v/qwvix+A+jb95ogJf+GOqn8NC8VsFLvjmYOdwdrJ4IxobyXdXXXWqwY27
 lkJ7HX/WdNjN+P3yrkxzmJKmH/BVJI49X+IWKfhqKWxCykw3MyrpiI1h66H7dFBZl8DgHjPsX
 ZO7Sv7ZaPMVDE4tNgscIwdE3eIWV6x/KjHBCJe2+x6fI4uYR20BHYeScGVBghZSJDY5bBfUyl
 ldfeQRr2DuqLxQehjN+pkca918WDYZGmxYjLr9VtA57XZUE30DomlKe7n/ryXkqxlABzWCSDd
 yDlzDA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rml4ZXM6CgogIC4uL3F2NGwyL2dlbmVyYWwtdGFiLmNwcDo0MzQ6MjI6IGVycm9yOiDigJhjbGFz
cyBRSEJveExheW91dOKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmHNldE1hcmdpbuKAmQogICAg
NDM0IHwgICAgICAgICAgICAgICAgIGJveC0+c2V0TWFyZ2luKDApOwogICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn5+fn5+CgogIC4uL3F2NGwyL2NhcHR1cmUtd2luLmNwcDoxMzA6
MjM6IGVycm9yOiDigJhjbGFzcyBRVkJveExheW91dOKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKA
mHNldE1hcmdpbuKAmQogICAgMTMwIHwgICAgICAgICBtX3Zib3hMYXlvdXQtPnNldE1hcmdpbigw
KTsKICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn4KCiAgLi4vcXY0bDIv
Y3RybC10YWIuY3BwOjI1NToyMjogZXJyb3I6IOKAmGNsYXNzIFFIQm94TGF5b3V04oCZIGhhcyBu
byBtZW1iZXIgbmFtZWQg4oCYc2V0TWFyZ2lu4oCZCiAgICAyNTUgfCAgICAgICAgIG1fYm94TGF5
b3V0LT5zZXRNYXJnaW4oMCk7CiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+
fn4KClNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KLS0t
CiB1dGlscy9xdjRsMi9jYXB0dXJlLXdpbi5jcHAgfCA0ICsrKysKIHV0aWxzL3F2NGwyL2N0cmwt
dGFiLmNwcCAgICB8IDQgKysrKwogdXRpbHMvcXY0bDIvZ2VuZXJhbC10YWIuY3BwIHwgNSArKysr
LQogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvdXRpbHMvcXY0bDIvY2FwdHVyZS13aW4uY3BwIGIvdXRpbHMvcXY0bDIvY2FwdHVy
ZS13aW4uY3BwCmluZGV4IDFlMzk4NmFkLi5lZjMzYTkxYiAxMDA2NDQKLS0tIGEvdXRpbHMvcXY0
bDIvY2FwdHVyZS13aW4uY3BwCisrKyBiL3V0aWxzL3F2NGwyL2NhcHR1cmUtd2luLmNwcApAQCAt
MTI3LDcgKzEyNywxMSBAQCB2b2lkIENhcHR1cmVXaW46OmJ1aWxkV2luZG93KFFXaWRnZXQgKnZp
ZGVvU3VyZmFjZSkKIAlpbnQgbCwgdCwgciwgYjsKIAltX3Zib3hMYXlvdXQgPSBuZXcgUVZCb3hM
YXlvdXQodGhpcyk7CiAJbV92Ym94TGF5b3V0LT5nZXRDb250ZW50c01hcmdpbnMoJmwsICZ0LCAm
ciwgJmIpOworI2lmIFFUX1ZFUlNJT04gPCAweDA2MDAwMAogCW1fdmJveExheW91dC0+c2V0TWFy
Z2luKDApOworI2Vsc2UKKwltX3Zib3hMYXlvdXQtPnNldENvbnRlbnRzTWFyZ2lucygwLCAwLCAw
LCAwKTsKKyNlbmRpZgogCW1fdmJveExheW91dC0+YWRkV2lkZ2V0KHZpZGVvU3VyZmFjZSwgMTAw
MCwgUXQ6OkFsaWduQ2VudGVyKTsKIAogCXNldENvbnRleHRNZW51UG9saWN5KFF0OjpDdXN0b21D
b250ZXh0TWVudSk7CmRpZmYgLS1naXQgYS91dGlscy9xdjRsMi9jdHJsLXRhYi5jcHAgYi91dGls
cy9xdjRsMi9jdHJsLXRhYi5jcHAKaW5kZXggNjdmNTU1NDYuLmNmZGVjZGViIDEwMDY0NAotLS0g
YS91dGlscy9xdjRsMi9jdHJsLXRhYi5jcHAKKysrIGIvdXRpbHMvcXY0bDIvY3RybC10YWIuY3Bw
CkBAIC0yNTIsNyArMjUyLDExIEBAIHZvaWQgQXBwbGljYXRpb25XaW5kb3c6OmFkZEN0cmwoUUdy
aWRMYXlvdXQgKmdyaWQsIGNvbnN0IHY0bDJfcXVlcnlfZXh0X2N0cmwgJnFlCiAJc3RydWN0IHY0
bDJfcXVlcnltZW51IHFtZW51OwogCVFXaWRnZXQgKndDb250YWluZXIgPSBuZXcgUVdpZGdldCgp
OwogCVFIQm94TGF5b3V0ICptX2JveExheW91dCA9IG5ldyBRSEJveExheW91dCh3Q29udGFpbmVy
KTsKKyNpZiBRVF9WRVJTSU9OIDwgMHgwNjAwMDAKIAltX2JveExheW91dC0+c2V0TWFyZ2luKDAp
OworI2Vsc2UKKwltX2JveExheW91dC0+c2V0Q29udGVudHNNYXJnaW5zKDAsIDAsIDAsIDApOwor
I2VuZGlmCiAJX191NjQgZGlmOwogCiAJc3dpdGNoIChxZWMudHlwZSkgewpkaWZmIC0tZ2l0IGEv
dXRpbHMvcXY0bDIvZ2VuZXJhbC10YWIuY3BwIGIvdXRpbHMvcXY0bDIvZ2VuZXJhbC10YWIuY3Bw
CmluZGV4IGI4M2NjYjY3Li4xMDVjNWNkZSAxMDA2NDQKLS0tIGEvdXRpbHMvcXY0bDIvZ2VuZXJh
bC10YWIuY3BwCisrKyBiL3V0aWxzL3F2NGwyL2dlbmVyYWwtdGFiLmNwcApAQCAtNDMwLDggKzQz
MCwxMSBAQCB2b2lkIEdlbmVyYWxUYWI6OmlucHV0U2VjdGlvbih2NGwyX2lucHV0IHZpbikKIAkJ
UUxhYmVsICpsID0gbmV3IFFMYWJlbCgiUmVmcmVzaCBUdW5lciBTdGF0dXMiLCBwYXJlbnRXaWRn
ZXQoKSk7CiAJCVFXaWRnZXQgKncgPSBuZXcgUVdpZGdldChwYXJlbnRXaWRnZXQoKSk7CiAJCVFI
Qm94TGF5b3V0ICpib3ggPSBuZXcgUUhCb3hMYXlvdXQodyk7Ci0KKyNpZiBRVF9WRVJTSU9OIDwg
MHgwNjAwMDAKIAkJYm94LT5zZXRNYXJnaW4oMCk7CisjZWxzZQorCQlib3gtPnNldENvbnRlbnRz
TWFyZ2lucygwLCAwLCAwLCAwKTsKKyNlbmRpZgogCQltX2RldGVjdFN1YmNoYW5zID0gbmV3IFFU
b29sQnV0dG9uKHcpOwogCQltX2RldGVjdFN1YmNoYW5zLT5zZXRJY29uKFFJY29uKCI6L2VudGVy
YnV0dC5wbmciKSk7CiAJCW1fc3ViY2hhbm5lbHMgPSBuZXcgUUxhYmVsKCIiLCB3KTsKLS0gCjIu
NDAuMAoK
