Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6D226E336C
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 22:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjDOULK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 16:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjDOULC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 16:11:02 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B657358C
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 13:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1681589459; i=ps.report@gmx.net;
        bh=SuqFgEJBS4/g+fquOfTJmRrju+9Qbv5Vu67JidAudAw=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=PgE2EZ4HdoB0qypAIB0iNeqGE7C0ON0OI7LtolnnY6pCq9c523BgjSAMVPTnq22pj
         ZXyOyAxu2yc7iYggjjeZYdWfmMN0kRgtbTkJIQUdUifbv/oz+pISYJrsOTpHcGEUgM
         2Juih8UzEzNVDMnv3UCIMXHA2Uh3uy3Nz+0WFhA1MnYS1rY6SdBq3LuDsNhX4JgoBI
         pGgL8CV+mL+bV6EEw0lyQ2at7yj0tQPJm2YGhFHEvk4tem/AFPfR9HcQM6j5WkmxCF
         MJBv/pLd9augn7QVkkn8q5yDKRmfQfQ/YOWV82XQUxLKKfEDPsGGELUnX7hepinYd1
         omlLO0/cEoDQA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.95]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bjy-1qPzK90apK-0186cz for
 <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 22:10:59 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 11/11] qvidcap: fix qmake project file
Date:   Sat, 15 Apr 2023 22:10:56 +0200
Message-Id: <20230415201056.31080-11-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415201056.31080-1-ps.report@gmx.net>
References: <20230415201056.31080-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:dpohvC94XOYNsUQQSukolWJNxcBfbhhDclk1uq+FGCnVHEJMxqo
 Anci/bH+mz+qLtZUuFTUCyxuZXtUZnvdMxICwLAIJ5nbxsF1CV4B8ET10/b25IuiWGvgxhX
 aoaU4nMAELlkBhHjveIgOgSB04dInSCgsacW26V1aelO2nMntVHzkrOFC4ngvNQj9VX94Iq
 mjZXlwjiaw1C1lnNgIf2g==
UI-OutboundReport: notjunk:1;M01:P0:yxe4hkjaGQw=;31MNsKcXzjVz2pRhk2HKqp9eau0
 dhSkT8lBuJPs/P3npCrk8Gyl0o5DTR9kLkySP1zTRdkmu8eJql2iXF1u7TX9N3kr8Vnh8TZOK
 QmxiuLq8tIMi7Dox7mZWjbKZc1Jl9lsqgRMlagvXVcxS/H71U0lczdueDXRRx+ZW5Mk6uaHHk
 l3XQAyoJmzWrJylaAuhotSPnBVkNrY8nNmUOLHUdDU+n64fclU1WimoNBiEMQPMPkqYZVzOej
 WG8WAw/mdoBiGsReyJ1AlIk5wvUj0tqXSjys6Ua9XIGZ7cSIzbaVYWzifL10hsgsjH8NCSuaF
 N/UzQy068GwrfNB+Yg07Cpe7SVEXPE5lnDV6HUuLJAO3qz/YUmacA3SX0H8uuM8eWoAvxyTb7
 KmsRVY3OlMTznS6NN8QjAAn5ceXRgwdAu0RsdbhaibYDooOwixbjMc2EpWnIob7yBVvNsI1/h
 LvA4rtoLF+o1gcxNACwVxaMcnx621SF3tHNrs9xH+IuAVe7GJE1XiuFoRnF7x+Ee4DCgN6oNy
 VE7adPnP79DZTFEqkeKk+ecveZ+7PuMKDqJ3RP+arRzte6RHSs7EqQ88WOaU6JoR+NdZOhJAU
 7EDNZoj0OuVdZcYDsopjKe711w6eTZ5L7sF3MH+A4CEizvvRlPzZe5S/hGq8BqDLteOT0GoOp
 M3J4M8P+fp1Bxa9fOndMa3mnrIhC3CwGngNisUod++9Mj0Gr76UvB22/vjrqEdvPNfvKzfqq7
 7CTvgI/K8KDXgSK+bE1xpA3niGd9hVIeT3LM3FVecAvdxRhq/2i63syRPq5cLLHcSbUn0n2Qq
 9yJl6aZYFxhSR3Un0TynEgJNulUtRGcKftCJzan1GkzxzMq73zbRlUMWxmP0Us04tryhIdDe3
 CUw8TTGRXNW6SciXcXTtp7J9k2lYlCfyeiN8G34oskD9Rsfu2ZM1wKeyHHntvnTFpYXBmL9Lw
 VsfDOw==
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
LSBhZGQgdjRsMi1jb252ZXJ0LnBsIGNhbGwgdG8gZ2VuZXJhdGUgdjRsMi1jb252ZXJ0LmgKLSBh
ZGQgbWlzc2luZyBjb21tb24vY29kZWMtdjRsMi1md2h0LmMgYW5kIGNvbW1vbi92NGwyLWluZm8u
Y3BwIGRlcGVuZGVuY3kKLSBhZGp1c3QgbG9jYWwgbGlicmFyeSBmaWxlIHBhdGhzCgpTaWduZWQt
b2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Ci0tLQogdXRpbHMvcXZp
ZGNhcC9xdmlkY2FwLnBybyB8IDIwICsrKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS91dGlscy9x
dmlkY2FwL3F2aWRjYXAucHJvIGIvdXRpbHMvcXZpZGNhcC9xdmlkY2FwLnBybwppbmRleCBlOWVh
ZjdjMi4uZGI5NDg2MTEgMTAwNjQ0Ci0tLSBhL3V0aWxzL3F2aWRjYXAvcXZpZGNhcC5wcm8KKysr
IGIvdXRpbHMvcXZpZGNhcC9xdmlkY2FwLnBybwpAQCAtOCwyOSArOCw0MSBAQCBDT05GSUcgKz0g
ZGVidWcKIAogZ3JlYXRlclRoYW4oUVRfTUFKT1JfVkVSU0lPTiwgNCk6IFFUICs9IHdpZGdldHMK
IAorIyBhZGp1c3QgdG8geW91ciBsb2NhbCBtZXNvbiBidWlsZCBwYXRoCitNRVNPTl9CVUlMRF9Q
QVRIID0gJCRQV0QvYnVpbGQtbWVzb24KKwogIyBvcGVuZ2w6IHRvIGRpc2FibGUgb3BlbmdsIHN1
cHBwb3J0IGNvbW1lbnQgb3V0IHRoZSBmb2xsb3dpbmcKICMgbGluZSBhbmQgdGhlIGxpbmUgJyNk
ZWZpbmUgSEFWRV9RVEdMIDEnIGZyb20gLi4vLi4vY29uZmlnLmgKIFFUICs9IG9wZW5nbAogCitR
TUFLRV9DRkxBR1MgKz0gLWluY2x1ZGUgJCRNRVNPTl9CVUlMRF9QQVRIL2NvbmZpZy5oCitRTUFL
RV9DWFhGTEFHUyArPSAtaW5jbHVkZSAkJE1FU09OX0JVSUxEX1BBVEgvY29uZmlnLmgKKwogSU5D
TFVERVBBVEggKz0gJCRQV0QvLi4vLi4KIElOQ0xVREVQQVRIICs9ICQkUFdELy4uL2NvbW1vbgog
SU5DTFVERVBBVEggKz0gJCRQV0QvLi4vdjRsMi1jb21wbGlhbmNlCiAKK3Y0bDJfY29udmVydF9o
b29rLmRlcGVuZHMgPSAkJFBXRC92NGwyLWNvbnZlcnQucGwgJCRQV0QvdjRsMi1jb252ZXJ0Lmds
c2wKK3Y0bDJfY29udmVydF9ob29rLmNvbW1hbmRzID0gcGVybCAkJFBXRC92NGwyLWNvbnZlcnQu
cGwgPCAkJFBXRC92NGwyLWNvbnZlcnQuZ2xzbCA+IHY0bDItY29udmVydC5oCitRTUFLRV9FWFRS
QV9UQVJHRVRTICs9IHY0bDJfY29udmVydF9ob29rCisKICMgSW5wdXQKIEhFQURFUlMgKz0gY2Fw
dHVyZS5oCiBIRUFERVJTICs9IHF2aWRjYXAuaAotSEVBREVSUyArPSAuLi8uLi9jb25maWcuaAor
SEVBREVSUyArPSAkJE1FU09OX0JVSUxEX1BBVEgvY29uZmlnLmgKIAogU09VUkNFUyArPSBjYXB0
dXJlLmNwcCBwYWludC5jcHAKIFNPVVJDRVMgKz0gcXZpZGNhcC5jcHAKIFNPVVJDRVMgKz0gLi4v
Y29tbW9uL3Y0bC1zdHJlYW0uYwogU09VUkNFUyArPSAuLi9jb21tb24vY29kZWMtZndodC5jCitT
T1VSQ0VTICs9IC4uL2NvbW1vbi9jb2RlYy12NGwyLWZ3aHQuYworU09VUkNFUyArPSAuLi9jb21t
b24vdjRsMi1pbmZvLmNwcAogU09VUkNFUyArPSAuLi9jb21tb24vdjRsMi10cGctY29yZS5jCiBT
T1VSQ0VTICs9IC4uL2NvbW1vbi92NGwyLXRwZy1jb2xvcnMuYwogCi1MSUJTICs9IC1MJCRQV0Qv
Li4vLi4vbGliL2xpYnY0bDIvLmxpYnMgLWx2NGwyCi1MSUJTICs9IC1MJCRQV0QvLi4vLi4vbGli
L2xpYnY0bGNvbnZlcnQvLmxpYnMgLWx2NGxjb252ZXJ0Ci1MSUJTICs9IC1MJCRQV0QvLi4vbGli
djRsMnV0aWwvLmxpYnMgLWx2NGwydXRpbAorTElCUyArPSAtTCQkTUVTT05fQlVJTERfUEFUSC9s
aWIvbGlidjRsMiAtbHY0bDIKK0xJQlMgKz0gLUwkJE1FU09OX0JVSUxEX1BBVEgvbGliL2xpYnY0
bGNvbnZlcnQgLWx2NGxjb252ZXJ0CitMSUJTICs9IC1MJCRNRVNPTl9CVUlMRF9QQVRIL3V0aWxz
L2xpYnY0bDJ1dGlsIC1sdjRsMnV0aWwKIExJQlMgKz0gLWxydCAtbGRsIC1sanBlZwogCiBSRVNP
VVJDRVMgKz0gcXZpZGNhcC5xcmMKLS0gCjIuNDAuMAoK
