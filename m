Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2426E3363
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 22:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjDOULB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 16:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbjDOULA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 16:11:00 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321183599
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 13:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1681589457; i=ps.report@gmx.net;
        bh=NM/C8G2lRBz0Gw0CGsVX9ntJubBtKRBkFtlFehYmRg4=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=XCYmKuzLRb1I2eUvixhvz17kS5AV+NLkp5p97DJ+xCXinksLPB2+M+GdsWMFYrFMm
         Hw1CtgVQ9selNpoU1/3a2DSMpt7kUz2G0MSYFcFTiJoVxywCRrd3pb/zvoiV/y4StQ
         FGJ1h47X+zxzNLI7FB51cz8+zQrZteb9WqM7QqLAv65pvI14hCsqFjYi4G8VVTr+0m
         xURAeJVESWrtceA0X66Y2JLmlvcrJN3R5pqXStgBmX5r0vgLDLP4RH2hw34+Bu0uAq
         WQRXWoXOMGEAmJZed5oKP2xAqe8NvcqOLmC1b/2PrL/04jTqAafZxQGj4wtaTzZXvI
         eTqLwaW98xUbQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.95]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9UK-1qfsI91gLE-00s6zr for
 <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 22:10:57 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 02/11] qv4l2: fix qmake project file
Date:   Sat, 15 Apr 2023 22:10:47 +0200
Message-Id: <20230415201056.31080-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415201056.31080-1-ps.report@gmx.net>
References: <20230415201056.31080-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:uEKAXQnwQ4YrEJVxIE+uh/sg0T3afDRLELTypvm9zfdsXSlVeAg
 HBSBCb1qAe4HWceLeMhJV9UxgWqeGuxCIbQ+vRjxckaqqekGTjHt+rNzdU1PuyVnXD+McEh
 ChqGnay5C8iDjORh9dS1mSCTZdEwGUZhK39o1snAK3jLRfOQTD2KhEXFuqiKfwXwqhYsq69
 3iqnTr/SpD/wzYBJHEszQ==
UI-OutboundReport: notjunk:1;M01:P0:YgE8dQH4PoU=;9i3UxWyXgnOEpa5ugamP2GANT4+
 7HBtb6Aq4XGQlsuRSNpLr5nMyedPK2MWNVhGaFpf/cIyo2cq6mtQU/SVh4y0B7v5POIZMSU4b
 p83dGzsim0E+8y8JAUQw6+jcv9kyF3YWG0YyShTJW8xU6zaXmA9hoT/53/kdn/Qq2OgL1CwAu
 hHKQTWYV+/Q8RnvFnSw+W3XMt/LNkQY5oFK6Q3O3QYZP2NxUHlax4O3ZuNGLesafK8BRL7uUt
 UI8IJ8/Ilu8jLL4lgwnNvObD82sVLEk1ONNVLg8II2qYBRKj1sz4qPHsFbauD+gFW3sXVqjFO
 4Pv9bFxDYGt5yaLMiF35MozAop4nMgJjmOn4LailtuhV6SWiy2iOsrjlpE9OgeofqO/koEa2s
 DrQbdshaA1L+pvxHyC25Ei9SZcRy35wMUXYIeanMIxC8OF7PEw9TYROVDxaKnMzPRNLMW+2H5
 zCYDU33kBic8rad3WSnv7n9q/qhhrxjLzz77zdmJjj7tp5Lk9E2pTOjhbONf9NZrJvwjyuSAY
 jOMa9ZpcoMHFDiAJF4rfUoqDQvF11I5M9WV4nIIUHMRtz9RF8q2OJntMlqtjk08py4G9hmhSd
 flQqXydQv3tiBV/bOHXPGNuMu6FbA9Q5qePwbQdM8hBDDSZX+tOPNItly7ggERUfaNGcK7d2Z
 XwnZsO7hp5purhFdRqVf+d1Mo9oeLkt2gj0GI18Gaal7QePcMa8xFQkw4fgfDKz64sHtyJ6FU
 JY8Di9jcr37G33CygmKyBadU6f9BcWoooNLEZpj6DsjZULMwh0NKzRLVx4feidkMWdaBk6ZRy
 /hwid0cKqOw+LtzvJhNrZuFDsLuHBeiVSZoQD79MAIyDqQRC3UHTxDAQbaeHs4sIg90nYszFJ
 XWSh63jeyoesXUC/mLefSlBh1PWbPM7+9+NgRAWT42mBoNJPoopJrlv693FvcPQ1LEgiuMhjg
 MtreZ1lzhAXavWR/h7Z57EWPfLA=
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MIME_BASE64_TEXT,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_PDS_PRO_TLD,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

LSBhZGQgTUVTT05fQlVJTERfUEFUSCB2YXJpYWJsZSAoYW5kIGN1c3RvbWl6ZSBoaW50KQotIGFk
ZCAnLWluY2x1ZGUnIGZvciBjb25maWcuaCBmaWxlIChhcyB0aGUgbWVzb24gYnVpbGQgZG9lcykK
LSBhZGQgYWxzYV9zdHJlYW0uYyBzb3VyY2UgZmlsZQotIGFkanVzdCBsb2NhbCBsaWJyYXJ5IGZp
bGUgcGF0aHMKLSBhZGQgbGliYXNvdW5kIGRlcGVuZGVuY3kKClNpZ25lZC1vZmYtYnk6IFBldGVy
IFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KLS0tCiB1dGlscy9xdjRsMi9xdjRsMi5wcm8g
fCAxNyArKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdXRpbHMvcXY0bDIvcXY0bDIucHJvIGIvdXRp
bHMvcXY0bDIvcXY0bDIucHJvCmluZGV4IDY0MjBmYTI0Li44Njk3ZDU1NCAxMDA2NDQKLS0tIGEv
dXRpbHMvcXY0bDIvcXY0bDIucHJvCisrKyBiL3V0aWxzL3F2NGwyL3F2NGwyLnBybwpAQCAtOCwx
MCArOCwxNiBAQCBDT05GSUcgKz0gZGVidWcKIAogZ3JlYXRlclRoYW4oUVRfTUFKT1JfVkVSU0lP
TiwgNCk6IFFUICs9IHdpZGdldHMKIAorIyBhZGp1c3QgdG8geW91ciBsb2NhbCBtZXNvbiBidWls
ZCBwYXRoCitNRVNPTl9CVUlMRF9QQVRIID0gJCRQV0QvYnVpbGQtbWVzb24KKwogIyBvcGVuZ2w6
IHRvIGRpc2FibGUgb3BlbmdsIHN1cHBwb3J0IGNvbW1lbnQgb3V0IHRoZSBmb2xsb3dpbmcKICMg
bGluZSBhbmQgdGhlIGxpbmUgJyNkZWZpbmUgSEFWRV9RVEdMIDEnIGZyb20gLi4vLi4vY29uZmln
LmgKIFFUICs9IG9wZW5nbAogCitRTUFLRV9DRkxBR1MgKz0gLWluY2x1ZGUgJCRNRVNPTl9CVUlM
RF9QQVRIL2NvbmZpZy5oCitRTUFLRV9DWFhGTEFHUyArPSAtaW5jbHVkZSAkJE1FU09OX0JVSUxE
X1BBVEgvY29uZmlnLmgKKwogSU5DTFVERVBBVEggKz0gJCRQV0QvLi4vLi4KIElOQ0xVREVQQVRI
ICs9ICQkUFdELy4uL2NvbW1vbgogSU5DTFVERVBBVEggKz0gJCRQV0QvLi4vdjRsMi1jdGwvCkBA
IC0yOCw4ICszNCw5IEBAIEhFQURFUlMgKz0gcmF3MnNsaWNlZC5oCiBIRUFERVJTICs9IHZiaS10
YWIuaAogSEVBREVSUyArPSAuLi9jb21tb24vdjRsMi10cGcuaAogSEVBREVSUyArPSAuLi9jb21t
b24vdjRsMi10cGctY29sb3JzLmgKLUhFQURFUlMgKz0gLi4vLi4vY29uZmlnLmgKK0hFQURFUlMg
Kz0gJCRNRVNPTl9CVUlMRF9QQVRIL2NvbmZpZy5oCiAKK1NPVVJDRVMgKz0gYWxzYV9zdHJlYW0u
YwogU09VUkNFUyArPSBjYXB0dXJlLXdpbi5jcHAKIFNPVVJDRVMgKz0gY2FwdHVyZS13aW4tZ2wu
Y3BwCiBTT1VSQ0VTICs9IGNhcHR1cmUtd2luLXF0LmNwcApAQCAtNDIsOSArNDksMTEgQEAgU09V
UkNFUyArPSB2YmktdGFiLmNwcAogU09VUkNFUyArPSAuLi92NGwyLWN0bC92NGwyLXRwZy1jb3Jl
LmMKIFNPVVJDRVMgKz0gLi4vdjRsMi1jdGwvdjRsMi10cGctY29sb3JzLmMKIAotTElCUyArPSAt
TCQkUFdELy4uLy4uL2xpYi9saWJ2NGwyLy5saWJzIC1sdjRsMgotTElCUyArPSAtTCQkUFdELy4u
Ly4uL2xpYi9saWJ2NGxjb252ZXJ0Ly5saWJzIC1sdjRsY29udmVydAotTElCUyArPSAtTCQkUFdE
Ly4uL2xpYnY0bDJ1dGlsLy5saWJzIC1sdjRsMnV0aWwgCitMSUJTICs9IC1MJCRNRVNPTl9CVUlM
RF9QQVRIL2xpYi9saWJ2NGwyIC1sdjRsMgorTElCUyArPSAtTCQkTUVTT05fQlVJTERfUEFUSC9s
aWIvbGlidjRsY29udmVydCAtbHY0bGNvbnZlcnQKK0xJQlMgKz0gLUwkJE1FU09OX0JVSUxEX1BB
VEgvdXRpbHMvbGlidjRsMnV0aWwgLWx2NGwydXRpbAorTElCUyArPSAtTCQkTUVTT05fQlVJTERf
UEFUSC91dGlscy9saWJtZWRpYV9kZXYgLWxtZWRpYV9kZXYKK0xJQlMgKz0gLWxhc291bmQgICMg
Y29tbWVudCBvdXQgaW4gY2FzZSBhbHNhIHNvdW5kIHN1cHBvcnQgaXMgZGlzYWJsZWQvbm90IGF2
YWlsYWJsZQogTElCUyArPSAtbHJ0IC1sZGwgLWxqcGVnCiAKIFJFU09VUkNFUyArPSBxdjRsMi5x
cmMKLS0gCjIuNDAuMAoK
