Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66FEC6E3367
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 22:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjDOULG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 16:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjDOULC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 16:11:02 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F8A3C23
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 13:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1681589458; i=ps.report@gmx.net;
        bh=zuaDm8afGiipjzOzECS/20cWSOAOdeqwh4DTVU2C9Qk=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=CKA6VLJMFE60cOkh3Mn5Y5SzwWkTyiWaejDDeUWuihN+dTDcF981XArdDm5tZKuMA
         nur5GAuVCmDqrxPucycC62O+QXTLFNeARknw58ha+jliKzjn7KAl1x5zoOroAGED5T
         2lBrVyQY8+6UBrk3hZNf31KeKvyFQbndvCsvWzfD9njLjKDd0YucH6yWwhPk8mu7PA
         V+phDt3uBJvETyqP8xu8EyP8pe/LikZunrhz4dVv/0T2s8mAUR24pIdVthBFFdP1Yl
         7Qs19N6tICQxiMxrDHGvx3VYPkjqavC4NZBjSsJc7SEOZCr0L4t2T94GsCLN4LV04y
         hkHHwqa7ENrmQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.95]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma24y-1ptOOU2YGS-00W1ml for
 <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 22:10:58 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 08/11] qv4l2: fix Qt6 compile (no matching function for call to QString::split(QRegExp))
Date:   Sat, 15 Apr 2023 22:10:53 +0200
Message-Id: <20230415201056.31080-8-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415201056.31080-1-ps.report@gmx.net>
References: <20230415201056.31080-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:PsiOptHDH9H2TOmmfW0/8AHgAmDHvXf+rlVC3W+HEt83SzlWnPB
 dPgO1JYkfYszG42PFx1Vkt2/p0aWGiAldFaAQ+SPy9QZ0+MzXStFtA5ntRTDoOzsGd6kR+u
 TfPbDLfKHMwbdfQ2kLh/8gGgb5OYKJTvFZeRgEO2oNuyn8Moo+ywWUOf0g6imCVYGU4puBN
 rINlmqYSMZ/osj5LxrGGQ==
UI-OutboundReport: notjunk:1;M01:P0:nTsORjf+2Jc=;Jk/uadfl72wifysaTgivodq2cxw
 xi3+32SrxNSS/gb6vsj2Tv9c64a61b6bMMtWjqVpptVX9LRfXLNPGCnK69ZfIBAWcH5vrZobn
 WYxJ58Jx8eHvbkpJrXluz6RKatbBszFqlpu39u6M57D+2UDq5yNbteetWA6ZZquw7cvW/JyrZ
 QuxMhk5uxMNY9d1Cd417lKoO2uJpSNAS1MM4fVdk8jH6olosJ8dQ324VtdyZzfbCrOztihK6p
 blLliA98i+SoH3G4PHTG6Nnjoe4/gsDD1v72gWxTV+UeTsJ9GeGmMY9AKkVTeVgelkZUPPeLi
 Hq+InmBMKGyrJO+An6AA9ZYk8n+MIOEiq0oFeD4ON6noGJ0djDvsqY8ucIXqo2YuqW5A7TeAw
 itZNBJyrtWNQDby6vhjVl3As9k43zn4Bf26lTmaOcfp2LkTkUthWd8/1TD89tMnHH2268eaEk
 t9dSYxGalycQhWtoK1BWJIcDBqI9IdOdHJId58d6IeEicHf2wBhUlYtxG9VnnD76mw5i0nw3V
 AQSYfjfdpikHBOQLksQVf078Qlx+HoCzY064vpmJLKgg5QdOCWZvAQ3NAZuKN3eDkyxn13Ysg
 Gh+Jojxc0LszAIHxUmbuU+vtzf7OH/vb4dFiCcKL7ERUGpQ6tk+D8diQnIz5WnWuYEcBA1KFt
 tUCsND7OOQhKN2LuJBWDhc4FLVHr27tBk99OIVpbDESlEXcljKJ4vodn0iEbeC7mNDkcYwqQh
 itnhYg68qp3MdXiqrxUHVrJEtQEHqXRNc1dVnUaYEjT0aGnIuuECIh4fI3sSUgCrw37o6JlvS
 rueizU7aoaDckQATcoqvGGqZhB20iH+lRLwsE+BPtSzPjF57asL1ovYnwOM1EZ537ZGlg3MAX
 RTaufjhKJqsdBo9a+zHiX56I2MYgnwiB2r2KfYo8JQbKwv49KJ9sSLkhDXsUymME4hjVbHy02
 urOSO1FaJERdakwU7PRkkaOTo2s=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rml4ZXM6CgogIC4uL3F2NGwyL2dlbmVyYWwtdGFiLmNwcDoyMzk2OjY5OiBlcnJvcjogbm8gbWF0
Y2hpbmcgZnVuY3Rpb24gZm9yIGNhbGwgdG8g4oCYUVN0cmluZzo6c3BsaXQoUVJlZ0V4cCnigJkK
ICAgMjM5NiB8ICAgICAgICAgICAgICAgICAgICAgICAgIFFTdHJpbmdMaXN0IGRldkFkZHIgPSBR
U3RyaW5nKGRldm5hbWUpLnNwbGl0KFFSZWdFeHAoIls6LF0iKSk7CiAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+
fn5+fl5+fn5+fn5+fn5+fn5+fn5+CgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMu
cmVwb3J0QGdteC5uZXQ+Ci0tLQogdXRpbHMvcXY0bDIvZ2VuZXJhbC10YWIuY3BwIHwgNiArKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS91dGlscy9x
djRsMi9nZW5lcmFsLXRhYi5jcHAgYi91dGlscy9xdjRsMi9nZW5lcmFsLXRhYi5jcHAKaW5kZXgg
OGJiMDNiNTkuLmZmYTQ0ZWNhIDEwMDY0NAotLS0gYS91dGlscy9xdjRsMi9nZW5lcmFsLXRhYi5j
cHAKKysrIGIvdXRpbHMvcXY0bDIvZ2VuZXJhbC10YWIuY3BwCkBAIC0yMzkzLDggKzIzOTMsMTQg
QEAgaW50IEdlbmVyYWxUYWI6OmNoZWNrTWF0Y2hBdWRpb0RldmljZSh2b2lkICptZCwgY29uc3Qg
Y2hhciAqdmlkLCBlbnVtIGRldmljZV90eXAKIAogCXdoaWxlICgoZGV2bmFtZSA9IGdldF9hc3Nv
Y2lhdGVkX2RldmljZShtZCwgZGV2bmFtZSwgdHlwZSwgdmlkLCBkdHlwZSkpICE9IE5VTEwpIHsK
IAkJaWYgKHR5cGUgPT0gTUVESUFfU05EX0NBUCkgeworI2lmIFFUX1ZFUlNJT04gPCAweDA2MDAw
MAogCQkJUVN0cmluZ0xpc3QgZGV2QWRkciA9IFFTdHJpbmcoZGV2bmFtZSkuc3BsaXQoUVJlZ0V4
cCgiWzosXSIpKTsKIAkJCXJldHVybiBkZXZBZGRyLnZhbHVlKDEpLnRvSW50KCk7CisjZWxzZQor
CQkJUVJlZ0V4cCByeCgiWzosXSIpOworCQkJcnguaW5kZXhJbihkZXZuYW1lKTsKKwkJCXJldHVy
biByeC5jYXAoMSkudG9JbnQoKTsKKyNlbmRpZgogCQl9CiAJfQogCXJldHVybiAtMTsKLS0gCjIu
NDAuMAoK
