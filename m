Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 541FA7CD792
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 11:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjJRJJ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 05:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjJRJJ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 05:09:58 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7228EFD
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 02:09:56 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-4a19dac27c4so2832722e0c.1
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697620195; x=1698224995; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bWn0AWQ8ZcYk91YSThLsJriDDFUVLU+dA3zLGJoEjvk=;
        b=RUlCEvKNiaRgTMAWphM3N2nPVxtmtTR+U8nnjHcAUgxS9qpzLn+2ir5NmpK6Hd92YS
         pRx3d3xuROU8ToUWarETKa/rhcucgyA96wAyGFrY9NN2sdoTuLmHjzbtph4vNdaNnBMC
         fCKVZLpOpap+v2oIrnB/e2/0CZthSeXrfqaUrHfcOezC+s+jasVvBBLlf8dYHmBL5Xn3
         nZQ343C2pILEqOqhWWkcxOR8hcgTC65GzqnNsHgP6vHQ60q7ESgl/QubnqsQCoY8OUya
         kN6Yen25TrBbInUcv+FiP23avu5RTqYuE6TWkxu6F84uolGrnvd25SIPnzhABM7dc0lT
         mmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697620195; x=1698224995;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bWn0AWQ8ZcYk91YSThLsJriDDFUVLU+dA3zLGJoEjvk=;
        b=ooYGMd8b2AimNKxX125nCZ/OcLVk207niV1LLEKlK0JakNsKlZlffQ9qkO7dPjmG0X
         CQSNwODRuExoapZVVXhovRsz5G5M9C5KGijYFCTvNYZcYUszvVSblLISey7QiTHrfZBt
         N/QtDeEQgo/G1uIPafoGZ8AX6aWsbx2QCRYDWjnQ56sTlkVZwiFBjdd0DTP4bcaBc8a8
         fs7QuYyy/oJnZAqO7+UWeR70kojaL/guurcnjpfn85SKeuxvaQNeHcO+krNDmTqhxyb5
         x6eCLaV8R6n3VcA0nx+bFTPgkqo/j3wTVAAO4ykeG7qVM2rgIkd2QIJPEaTxOiM5VOqT
         VzwQ==
X-Gm-Message-State: AOJu0YwsTLpFzifTU5095CSPSg3cuGbEKsAfmWC92Mrp3egC6fe829JD
        AisfyuXgrOnUR90QaPTKJD1eAQaDnzhUV1UXEj7gxgrBCyE=
X-Google-Smtp-Source: AGHT+IH5mMmdVktm97VhLQVLs1BG14+aCYuWaNoCob6d6rqZbj7XjZd6++nEXh8rzjGiG79xvR4jEx0Q3Gc+i7k40dQ=
X-Received: by 2002:a05:6122:a09:b0:495:db2f:f4e7 with SMTP id
 9-20020a0561220a0900b00495db2ff4e7mr5030985vkn.1.1697620195392; Wed, 18 Oct
 2023 02:09:55 -0700 (PDT)
MIME-Version: 1.0
From:   Kostyantyn Sushchyk <ksushchyk@gmail.com>
Date:   Wed, 18 Oct 2023 12:09:44 +0300
Message-ID: <CAKx9isKAtha1QAgKLrFbkyQwpvWipEzTCH33XVqw3rYxtM+wYg@mail.gmail.com>
Subject: DVB-T2 channels for Lviv, Ukraine
To:     linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000b5ee660607fa00b8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--000000000000b5ee660607fa00b8
Content-Type: text/plain; charset="UTF-8"

Hello
Please find a patch file with DVB-T2 channels for Lviv, Ukraine

Regards,
Kostyantyn

--000000000000b5ee660607fa00b8
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-dtv-scan-tables-added-channels-for-Lviv-Ukraine.patch"
Content-Disposition: attachment; 
	filename="0001-dtv-scan-tables-added-channels-for-Lviv-Ukraine.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lnvj6zni0>
X-Attachment-Id: f_lnvj6zni0

RnJvbTogS29zdHlhbnR5biBTdXNoY2h5ayA8a3N1c2hjaHlrQGdtYWlsLmNvbT4KRGF0ZTogVHVl
LCAxNyBPY3QgMjAyMyAxMTowNzoxNSArMDMwMApTdWJqZWN0OiBbUEFUQ0hdIGR0di1zY2FuLXRh
YmxlczogYWRkZWQgY2hhbm5lbHMgZm9yIEx2aXYsIFVrcmFpbmUKCi0tLQogZHZiLXQvdWEtTHZp
diB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDM2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkdmItdC91YS1Mdml2Cgpk
aWZmIC0tZ2l0IGEvZHZiLXQvdWEtTHZpdiBiL2R2Yi10L3VhLUx2aXYKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAuLmYwOWZkYWJmCi0tLSAvZGV2L251bGwKKysrIGIvZHZiLXQv
dWEtTHZpdgpAQCAtMCwwICsxLDM2IEBACisjIFVrcmFpbmUsIEx2aXYKK1tDSEFOTkVMXQorICAg
ICAgICBERUxJVkVSWV9TWVNURU0gPSBEVkJUMgorICAgICAgICBGUkVRVUVOQ1kgPSA0ODIwMDAw
MDAKKyAgICAgICAgQkFORFdJRFRIX0haID0gODAwMDAwMAorICAgICAgICBDT0RFX1JBVEVfSFAg
PSAzLzUKKyAgICAgICAgQ09ERV9SQVRFX0xQID0gTk9ORQorICAgICAgICBNT0RVTEFUSU9OID0g
UUFNLzI1NgorICAgICAgICBUUkFOU01JU1NJT05fTU9ERSA9IDMySworICAgICAgICBHVUFSRF9J
TlRFUlZBTCA9IDEvMTYKKyAgICAgICAgSElFUkFSQ0hZID0gTk9ORQorICAgICAgICBJTlZFUlNJ
T04gPSBBVVRPCisKK1tDSEFOTkVMXQorICAgICAgICBERUxJVkVSWV9TWVNURU0gPSBEVkJUMgor
ICAgICAgICBGUkVRVUVOQ1kgPSA1MzAwMDAwMDAKKyAgICAgICAgQkFORFdJRFRIX0haID0gODAw
MDAwMAorICAgICAgICBDT0RFX1JBVEVfSFAgPSAzLzUKKyAgICAgICAgQ09ERV9SQVRFX0xQID0g
Tk9ORQorICAgICAgICBNT0RVTEFUSU9OID0gUUFNLzI1NgorICAgICAgICBUUkFOU01JU1NJT05f
TU9ERSA9IDMySworICAgICAgICBHVUFSRF9JTlRFUlZBTCA9IDEvMTYKKyAgICAgICAgSElFUkFS
Q0hZID0gTk9ORQorICAgICAgICBJTlZFUlNJT04gPSBBVVRPCisKK1tDSEFOTkVMXQorICAgICAg
ICBERUxJVkVSWV9TWVNURU0gPSBEVkJUMgorICAgICAgICBGUkVRVUVOQ1kgPSA2MjYwMDAwMDAK
KyAgICAgICAgQkFORFdJRFRIX0haID0gODAwMDAwMAorICAgICAgICBDT0RFX1JBVEVfSFAgPSAz
LzUKKyAgICAgICAgQ09ERV9SQVRFX0xQID0gTk9ORQorICAgICAgICBNT0RVTEFUSU9OID0gUUFN
LzI1NgorICAgICAgICBUUkFOU01JU1NJT05fTU9ERSA9IDMySworICAgICAgICBHVUFSRF9JTlRF
UlZBTCA9IDEvMTYKKyAgICAgICAgSElFUkFSQ0hZID0gTk9ORQorICAgICAgICBJTlZFUlNJT04g
PSBBVVRPCi0tIAoyLjI1LjEKCg==
--000000000000b5ee660607fa00b8--
