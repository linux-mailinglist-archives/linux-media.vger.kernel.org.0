Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 118016E3366
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 22:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjDOULF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 16:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjDOULB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 16:11:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404B73AB3
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 13:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1681589458; i=ps.report@gmx.net;
        bh=SFZYmKbGLVMUoMrWr/dJQquMRT787THV/BxLgXqWKb4=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=ObeUuZL9Kv2NN5c+Hu8nz6vAScCxhfmRIJpo9BiCEY+6Qj65bqNL4Fuh8Yfj3+VQB
         vEPv8SZSgED/DwaXRE7aG8KARORTMq15FBq4Vv0CUcXtPKcJ3c16rv+Lg1TEr3sFST
         WZEftDqeANj0AaPv8pGu9Ets+yF5zC3L0J8ttGcpMUbSTSAWY39nPhFB6HBdW+LdW+
         uyei6DgLmkRlYdpqfTxLM2+9OacDbjadLz6BRTQ0e9vfPisamroBNd5jQDhJBLTK2R
         ln8hItE0PEP9ZJcJRYmiX5dsJegfScESut2+3YKvpQ47hGFs4Xyn3WEEYnADMnPpUx
         jXmcOt8kSNAxw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.95]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgvrB-1qHMMB1cKr-00hKHa for
 <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 22:10:58 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 07/11] qv4l2: fix Qt6 compile (missing QActionGroup header)
Date:   Sat, 15 Apr 2023 22:10:52 +0200
Message-Id: <20230415201056.31080-7-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415201056.31080-1-ps.report@gmx.net>
References: <20230415201056.31080-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:u81Ln9xwdW0Sp/+zP6oobrVQxRe7Ejxglp+Yh351oMPM3fwPniN
 /sBQJp2d4i7iM8qXoEBYopGA4KRX3qL7QyflMbUJLsuHKJglvc3wpW3RJMtG6zm48iFse/Y
 WNEAkKx8KGIoJIc9ROa7KcsT2+WGtxWZ9y+sY5B0Z3fuEfJaWs2dRaPSIgaVqg/I2qreHej
 ZwMbTuW2Th2tf5yBZCYiQ==
UI-OutboundReport: notjunk:1;M01:P0:1T/5QJ9kN/E=;Nxey3sFrjN3hiTAEjp3huiAcHMP
 FcCw7dor1wbH+VDcvrtBtAuIT6Oq+OeMZVoabtaqsgiTcCL8RZ1ofrYeFbIwW5oEdh8k3mNGv
 BgK9PZgKFpJ+OlxL3eVf7iWE1yFVwVMJibH/5H6M4vlcClQPztCj5mNmQDdJ9eykL+e6Gdyww
 PPYyFxIPMh5mCb44E6wcB47VMrenPTxd8C4mZCNFIXZs89q5yPu8YXYRBsuL/iyq0ThZNW7YF
 SaHgko7S/ESNovXsoOfFKGYsy7Y6fHTSMGQn1oOd/wnwV8p+Di+AlnsIbDwJFNXH8zHlRwXxp
 wpDkPOAaDPxUzfXxWh0VWfoPlkXu/rMfu/E49f/q5kI69nRRlTxgs9RLGsSOJcT8UTN208rTD
 nLN4YHVbsa0tatTetDay7UEq4KJalq3uZD+9iyFUrcBsZvIeeVV59v3+keF+mpizLMzCKgtnX
 UcTKvpKftLsozH6biu1DKqOCAd5SJEvlpoHg9cNNn8/wqM284rWAIVPfO0HLyhlXpscBrQ2vw
 HjH2JYGAr5oFXdVgmG9enHsghgqD4ebDQ2D7tprxyhC2Zg4YmEFCeFelQWcVP2Oon3+Eaejk5
 kSgmi1qkstJ+eK8il/bv0ZZuUZ4AeFpwffak5TjsMHd2hRftJUuSSCpu+F6tRN78zo4gUOExY
 sYTARsTAMhUj5Jhias4JNGw9bMCoOrC0X/GZWgSuRhwf7BvWEJEd6Hb+utNou6q/Tlw/EmQ7R
 v0NcWRRbNpw2TQxFpKuXwpTOPxwSn/fsft3QHcLpEnv04hLu+WHlPl5goENQdN57GxLFlRShB
 uRFfHtvMinmbBDZbIiC3wTASZ/VM+iifxhiAzVeERFKkBOCUfR+P2dkFY67Y+fIVTnAsM1Q/i
 Af9s5IFbPwz3USFgrov/ME6JcO9XAntZFGfYlyRtjdFG44XzuDmK8czjmSSgX+cCwwPUTOQKI
 uo7YcA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rml4ZXM6CgogIC4uL3F2NGwyL3F2NGwyLmNwcDoyNDY6MzY6IGVycm9yOiBpbnZhbGlkIHVzZSBv
ZiBpbmNvbXBsZXRlIHR5cGUg4oCYY2xhc3MgUUFjdGlvbkdyb3Vw4oCZCiAgICAyNDYgfCAgICAg
ICAgIGdycCA9IG5ldyBRQWN0aW9uR3JvdXAobWVudSk7CiAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4KClNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxw
cy5yZXBvcnRAZ214Lm5ldD4KLS0tCiB1dGlscy9xdjRsMi9xdjRsMi5jcHAgfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3V0aWxzL3F2NGwyL3F2NGwy
LmNwcCBiL3V0aWxzL3F2NGwyL3F2NGwyLmNwcAppbmRleCBlMjRiZWYxMy4uZTQ5YTQ1OTkgMTAw
NjQ0Ci0tLSBhL3V0aWxzL3F2NGwyL3F2NGwyLmNwcAorKysgYi91dGlscy9xdjRsMi9xdjRsMi5j
cHAKQEAgLTM5LDYgKzM5LDcgQEAKICNpbmNsdWRlIDxRVGhyZWFkPgogI2luY2x1ZGUgPFFDbG9z
ZUV2ZW50PgogI2luY2x1ZGUgPFFJbnB1dERpYWxvZz4KKyNpbmNsdWRlIDxRQWN0aW9uR3JvdXA+
CiAKICNpbmNsdWRlIDxhc3NlcnQuaD4KICNpbmNsdWRlIDxzeXMvbW1hbi5oPgotLSAKMi40MC4w
Cgo=
