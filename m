Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9EF86E3365
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 22:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjDOULE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 16:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjDOULB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 16:11:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D3C3AAE
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 13:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1681589458; i=ps.report@gmx.net;
        bh=cxjIsTRxd7rpfE2B6wNkw+zVQyLmAhhqgcITcoNqFO8=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=Vh2k/2bOjMxwP/IDxkKTCVymZqxvjBMjbLYtBN7hPX/5N6nn+m44dpvH9XbB7M3pU
         LouGgHY5R5OOd7Qfxh8UE1CQJ+eNQn5WRXQApQyAXH7Fta2Tr4CK3/yPi97t7Misqi
         lFBY3B7x/lU/kOtb1f2cZFF3+Qe+A9C/jjJnsXYpzDSbgUtrsId/MTPrfYIncZpEyf
         U7RPo+24wkyn4c3nx54I1DU2myEFONOnQVNVKjB2Zj4vM5vhpDhq51iBhErl7nfDyy
         BlEWUWn+ZHjeuUYPflwaWLx6DYs7i7bIwYNKKuFTrirtPW0wqpEQx6x+yVDPmjqlzr
         XI4HvKInykabw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.95]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpNy-1qMZ1M0qyg-00ZttF for
 <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 22:10:58 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 06/11] qv4l2: fix Qt6 compile (ambiguous overload for operator!=)
Date:   Sat, 15 Apr 2023 22:10:51 +0200
Message-Id: <20230415201056.31080-6-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415201056.31080-1-ps.report@gmx.net>
References: <20230415201056.31080-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:IyHhUS4+u6vjnJYSbRd2iw+cZuZ4BzNfBGEbPMLGrInD8DQvH8v
 ajH6IggOmrnrFeQaDiRbTy8XDXcHrDhuU0xFiQtfH9jmO+pOFwET7ys4rnOwFO0Z7Az82i7
 lMtO8R6eFOxf9odtaTXt2KMsSyMjX4CbLlxbkNZ4oLPcSvCW+luGKf34MTU0Fl9n0GTF/eo
 KAkIG4ZfEx3TFMuA5XYiw==
UI-OutboundReport: notjunk:1;M01:P0:mzCf3ixH5Ko=;YcfHx7uEb401NKLtCg6dqcoz5O6
 vSMxazU7b7hcfmwCHQ9Zl3YbIkvdNrtRa+ue+MWQpUFkjek5D4Lnzj/sCqykoXP7wxuay/Vh+
 Em3No49qtxvs24lvfkhDr8vfmwuOFaYzHpHhVETwiYsSGLxKYZqIZr1trsCkAyy1d/R3el1e/
 846BWHFqeZeHyFTgJcTmHb7vmG9TbL1jHOvifUrWtN9lRoxWOlVpJF7kM424RGm+No8xyjLHz
 KcgC8Tprn75F/d9mQyUYG18Ey2I2jSQwpZi/gyF/Nl46+uuPc5tCxPCseNSjHqd8aGMRA7odM
 Bk4aG/6nHXrBF9BcAOUyE13J9YIfQmZwmLn1Ss6uZSLb5CUe5USRVzeGeByy/scWQoFWY3509
 38YXEmIxJxMzTBkWQfcPjdEUAlRjthz8lPNHLPlHCxVlqn0KHgfIiRalezlVJYupDXSBU/Hjh
 E6+ruP7uTljimIUwS6QKoKhTJEiLEvOKDyebLMlZz1vnjFX3BgZYbylPn7sy6OR5nltMdx7GY
 wxrUoh3YMwkZTQ6EQoAc9TLVZFJ1o/z9vmhRhGqzfTFLmiCuaVm+n6KkCN6Ieyy2X5Pf8Jqwz
 xTSMwKsAZftmI3BjHLau782xhmr8CL/kevDWqHnYqb1RDMw1MjjBOke7aIPR/KWJEi+jWsRIT
 l/XRxXplegnGaUbSEMgvc02tU3RhQ9TWTBRVtKt3+1qD0vqxY4OuxScq7zjhNqpKl7ZqZ3cTv
 SyuyjuiSAmfi1DbQO7cDR0/TnSOe3M1o94kCr7LwCVQ7QunTiQsJKl1+cZ0HovIngS0toHpmC
 ZXGg+rZbu0jcaBvp6R6ruKA14J/62jYW4kIcwuoDAmYKGzdMeK23Sx3bE2RJnWPvdgOFVQRPx
 9oVUvdr/3zxho8Buhkdp7Fp/htVBGWs/VAslbJAdpZnpGWLd6CtirgCiocOlktZAuvwy5b3z/
 qtZgXBQoYUBIajfFTCdsat2rez0=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rml4ZXM6CgogIC4uL3F2NGwyL2dlbmVyYWwtdGFiLmNwcDoxMTEzOjU3OiBlcnJvcjogYW1iaWd1
b3VzIG92ZXJsb2FkIGZvciDigJhvcGVyYXRvciE94oCZIChvcGVyYW5kIHR5cGVzIGFyZSDigJhR
U3RyaW5n4oCZIGFuZCDigJhsb25nIGludOKAmSkKICAgMTExMyB8ICAgICAgICAgbV9hdWRpb091
dERldmljZS0+c2V0RW5hYmxlZChnZXRBdWRpb0luRGV2aWNlKCkgIT0gTlVMTCA/IGdldEF1ZGlv
SW5EZXZpY2UoKS5jb21wYXJlKCJOb25lIikgOiBmYWxzZSk7CiAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCiAgLi4vcXY0
bDIvcXY0bDIuY3BwOjEyNjE6MTk6IGVycm9yOiBhbWJpZ3VvdXMgb3ZlcmxvYWQgZm9yIOKAmG9w
ZXJhdG9yIT3igJkgKG9wZXJhbmQgdHlwZXMgYXJlIOKAmFFTdHJpbmfigJkgYW5kIOKAmGxvbmcg
aW504oCZKQogICAxMjYxIHwgICAgICAgICBpZiAoYXVkSW4gIT0gTlVMTCAmJiBhdWRPdXQgIT0g
TlVMTCAmJiBhdWRJbi5jb21wYXJlKCJOb25lIikgJiYgYXVkSW4uY29tcGFyZShhdWRPdXQpICE9
IDApIHsKICAgICAgICB8ICAgICAgICAgICAgICAgICAgIF4KCiAgLi4vcXY0bDIvcXY0bDIuY3Bw
OjE5MTI6MjY6IGVycm9yOiBhbWJpZ3VvdXMgb3ZlcmxvYWQgZm9yIOKAmG9wZXJhdG9yIT3igJkg
KG9wZXJhbmQgdHlwZXMgYXJlIOKAmFFTdHJpbmfigJkgYW5kIOKAmGxvbmcgaW504oCZKQogICAx
OTEyIHwgICAgICAgICBpZiAodmlkZW9fZGV2aWNlICE9IE5VTEwpCiAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgXgoKICAuLi9xdjRsMi9xdjRsMi5jcHA6MTkxNDoyOTogZXJyb3I6
IGFtYmlndW91cyBvdmVybG9hZCBmb3Ig4oCYb3BlcmF0b3IhPeKAmSAob3BlcmFuZCB0eXBlcyBh
cmUg4oCYUVN0cmluZ+KAmSBhbmQg4oCYbG9uZyBpbnTigJkpCiAgIDE5MTQgfCAgICAgICAgIGVs
c2UgaWYgKHZiaV9kZXZpY2UgIT0gTlVMTCkKICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeCgogIC4uL3F2NGwyL3F2NGwyLmNwcDoxOTE2OjMxOiBlcnJvcjogYW1iaWd1b3Vz
IG92ZXJsb2FkIGZvciDigJhvcGVyYXRvciE94oCZIChvcGVyYW5kIHR5cGVzIGFyZSDigJhRU3Ry
aW5n4oCZIGFuZCDigJhsb25nIGludOKAmSkKICAgMTkxNiB8ICAgICAgICAgZWxzZSBpZiAocmFk
aW9fZGV2aWNlICE9IE5VTEwpCiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeCgogIC4uL3F2NGwyL3F2NGwyLmNwcDoxOTE4OjI5OiBlcnJvcjogYW1iaWd1b3VzIG92ZXJs
b2FkIGZvciDigJhvcGVyYXRvciE94oCZIChvcGVyYW5kIHR5cGVzIGFyZSDigJhRU3RyaW5n4oCZ
IGFuZCDigJhsb25nIGludOKAmSkKICAgMTkxOCB8ICAgICAgICAgZWxzZSBpZiAoc2RyX2Rldmlj
ZSAhPSBOVUxMKQogICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KClNpZ25l
ZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KLS0tCiB1dGlscy9x
djRsMi9nZW5lcmFsLXRhYi5jcHAgfCAgMiArLQogdXRpbHMvcXY0bDIvcXY0bDIuY3BwICAgICAg
IHwgMTAgKysrKystLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdXRpbHMvcXY0bDIvZ2VuZXJhbC10YWIuY3BwIGIvdXRp
bHMvcXY0bDIvZ2VuZXJhbC10YWIuY3BwCmluZGV4IDEwNWM1Y2RlLi44YmIwM2I1OSAxMDA2NDQK
LS0tIGEvdXRpbHMvcXY0bDIvZ2VuZXJhbC10YWIuY3BwCisrKyBiL3V0aWxzL3F2NGwyL2dlbmVy
YWwtdGFiLmNwcApAQCAtMTExMCw3ICsxMTEwLDcgQEAgYm9vbCBHZW5lcmFsVGFiOjpjcmVhdGVB
dWRpb0RldmljZUxpc3QoKQogCiB2b2lkIEdlbmVyYWxUYWI6OmNoYW5nZUF1ZGlvRGV2aWNlKCkK
IHsKLQltX2F1ZGlvT3V0RGV2aWNlLT5zZXRFbmFibGVkKGdldEF1ZGlvSW5EZXZpY2UoKSAhPSBO
VUxMID8gZ2V0QXVkaW9JbkRldmljZSgpLmNvbXBhcmUoIk5vbmUiKSA6IGZhbHNlKTsKKwltX2F1
ZGlvT3V0RGV2aWNlLT5zZXRFbmFibGVkKGdldEF1ZGlvSW5EZXZpY2UoKSAhPSBudWxscHRyID8g
Z2V0QXVkaW9JbkRldmljZSgpLmNvbXBhcmUoIk5vbmUiKSA6IGZhbHNlKTsKIAllbWl0IGF1ZGlv
RGV2aWNlQ2hhbmdlZCgpOwogfQogCmRpZmYgLS1naXQgYS91dGlscy9xdjRsMi9xdjRsMi5jcHAg
Yi91dGlscy9xdjRsMi9xdjRsMi5jcHAKaW5kZXggZWExYWMyMDEuLmUyNGJlZjEzIDEwMDY0NAot
LS0gYS91dGlscy9xdjRsMi9xdjRsMi5jcHAKKysrIGIvdXRpbHMvcXY0bDIvcXY0bDIuY3BwCkBA
IC0xMjU4LDcgKzEyNTgsNyBAQCB2b2lkIEFwcGxpY2F0aW9uV2luZG93OjpzdGFydEF1ZGlvKCkK
IAlRU3RyaW5nIGF1ZEluID0gbV9nZW5UYWItPmdldEF1ZGlvSW5EZXZpY2UoKTsKIAlRU3RyaW5n
IGF1ZE91dCA9IG1fZ2VuVGFiLT5nZXRBdWRpb091dERldmljZSgpOwogCi0JaWYgKGF1ZEluICE9
IE5VTEwgJiYgYXVkT3V0ICE9IE5VTEwgJiYgYXVkSW4uY29tcGFyZSgiTm9uZSIpICYmIGF1ZElu
LmNvbXBhcmUoYXVkT3V0KSAhPSAwKSB7CisJaWYgKGF1ZEluICE9IG51bGxwdHIgJiYgYXVkT3V0
ICE9IG51bGxwdHIgJiYgYXVkSW4uY29tcGFyZSgiTm9uZSIpICYmIGF1ZEluLmNvbXBhcmUoYXVk
T3V0KSAhPSAwKSB7CiAJCWFsc2FfdGhyZWFkX3N0YXJ0dXAoYXVkT3V0LnRvTGF0aW4xKCkuZGF0
YSgpLCBhdWRJbi50b0xhdGluMSgpLmRhdGEoKSwKIAkJCQkgICAgbV9nZW5UYWItPmdldEF1ZGlv
RGV2aWNlQnVmZmVyU2l6ZSgpLCBOVUxMLCAwKTsKIApAQCAtMTkwOSwxMyArMTkwOSwxMyBAQCBp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJCX0KIAl9CiAKLQlpZiAodmlkZW9fZGV2
aWNlICE9IE5VTEwpCisJaWYgKHZpZGVvX2RldmljZSAhPSBudWxscHRyKQogCQlkZXZpY2UgPSBn
ZXREZXZpY2VOYW1lKCIvZGV2L3ZpZGVvIiwgdmlkZW9fZGV2aWNlKTsKLQllbHNlIGlmICh2Ymlf
ZGV2aWNlICE9IE5VTEwpCisJZWxzZSBpZiAodmJpX2RldmljZSAhPSBudWxscHRyKQogCQlkZXZp
Y2UgPSBnZXREZXZpY2VOYW1lKCIvZGV2L3ZiaSIsIHZiaV9kZXZpY2UpOwotCWVsc2UgaWYgKHJh
ZGlvX2RldmljZSAhPSBOVUxMKQorCWVsc2UgaWYgKHJhZGlvX2RldmljZSAhPSBudWxscHRyKQog
CQlkZXZpY2UgPSBnZXREZXZpY2VOYW1lKCIvZGV2L3JhZGlvIiwgcmFkaW9fZGV2aWNlKTsKLQll
bHNlIGlmIChzZHJfZGV2aWNlICE9IE5VTEwpCisJZWxzZSBpZiAoc2RyX2RldmljZSAhPSBudWxs
cHRyKQogCQlkZXZpY2UgPSBnZXREZXZpY2VOYW1lKCIvZGV2L3N3cmFkaW8iLCBzZHJfZGV2aWNl
KTsKIAllbHNlCiAJCWRldmljZSA9ICIvZGV2L3ZpZGVvMCI7Ci0tIAoyLjQwLjAKCg==
