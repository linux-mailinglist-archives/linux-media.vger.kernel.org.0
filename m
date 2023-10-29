Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6427DAC86
	for <lists+linux-media@lfdr.de>; Sun, 29 Oct 2023 13:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjJ2MtU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Oct 2023 08:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjJ2MtT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Oct 2023 08:49:19 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC85FC
        for <linux-media@vger.kernel.org>; Sun, 29 Oct 2023 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=s31663417; t=1698583737; x=1699188537; i=wahrenst@gmx.net;
        bh=kTr212Lg0Df4P2OkP/wn1JqHpovW6pFvMio/bpAXQSk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=oS+Xcqt86UPqRnjm6B2jXvL8j1o0W2NgEmp/QOJJ7xXqrylmTKZ9jklY21stEFVO
         g24hh6Alu/yjUOIQWcINsf4KjUkTuvgrOdoaS/efHdDrrkGAGESPtWfg8sDkRVw+3
         haiZeZ8XcTJgN26r5ejogIbcvYQJLglMDA7zm3i2p3D/zgUPb0GFLhxHH+mPJ+uN1
         IoA4URWw2aBpomcDO6/g1XKQVklNiGCivVdCj5iwesyGjed4/2di7tyZ4usE124HB
         mh1rx1KLFayqHmGF2IwBf+pBVREro8TJxwHb3MNnSJaWiqAEvZxY66nLG9fadsUKK
         DJS89T5WQjusKf3VnQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNNy-1r0sqh05go-00VQKr; Sun, 29
 Oct 2023 13:48:57 +0100
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Umang Jain <umang.jain@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Florian Fainelli <florian.fainelli@broadcom.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 0/3] staging: vchiq_arm: move state dump to debugfs
Date:   Sun, 29 Oct 2023 13:48:34 +0100
Message-Id: <20231029124837.119832-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9fDo3xOsm6/9cqGspy8ReIQfJkucNemt3xpnd3uUYxUYeM8qQ4M
 rsNcDVqkiHO1AIvG3jtkUJnEIZZtZsw1u9Xf3l3gJsCfEcyqm6thoSulMiFZZkLtX8b5xm7
 s3wOgMkFLudmAubbiy829N/6YoSf0BJ2iTvsycJW0PZZafcBBvrOglnmgHiA3cf3jiJw/pY
 pXhneSKqA91GSIUskoLAA==
UI-OutboundReport: notjunk:1;M01:P0:wyO8vth6O3A=;g/XvHHTO9tXjOtBygqck3IL92nu
 3TlNXQj2e0vdTBv1TNlmvu8RKqh/HIOHeC1oKeCQo0JDJqsULqEy88972+UIa8Q6pNRwgcqEr
 HufqW4tGv+PtzOAGsSN80Wd4amcYM04bJUC50pOnPvr6NfrDBn1qrFJpJPGvf0g4x/IVU6fzl
 Z9sbeYLVnQKfwgMz3uKMuYUcHD7Tilm19q2rOEO9e4BeJS6LZJOGDJwPrryEQNmZ+4CxfhE71
 0Mn+Yd4YVPEpvAizfCKiVuDWlVU/lITb6DaYJD8wHmicWHvM4fvp86XTJwFM0Azj1kUU9Cx0s
 7+3I+sjDASUXUMI6Ou26MuQWvGxmksN/tZ34pYI41Aj4Tc5uSfI4SWyjto4ZVluNiNa6rWknI
 GOuP1iQVCAHeTHD178DPxOGEFzaaNMasqlxppkh925ax/rmvzYIsaviH5bzBJzPFVoWXIHFut
 geLOu5XgOqFdYibz0aG1/TGUGygIxXggn8f6/SUIpPJEO9OmGNdRWMxcJJ66XK5WaEQD2z791
 o+0bNC09Z4/hHt3YvGdrJnQpZDtnknwtA0Q7UraAjhNSZM1ObtZhJ0d7bc4wfyXipnp5Ff6O5
 60S/GsJR4jDmOH+nNIrCUVdWSXDXbzo3Qg1ZDzcBZAWnwPMXy88I+AXXO1QzzX6v3cGpjXtr5
 BPmDOnru4Hgl1YHU7/Vo5XwDdrATqCjn+CYHwI/6SJtplN+7KUjMHpf/lHHoeCsZglsE6PK64
 TFmZrmhdd6WjCu1FRAht/Ca8zI1XjlywaQYK94aSM+11Jsoa/FPqFYoGog9vctWHSX3lgbP9d
 V3YDCjP+mDBqBNrY5MKOj+9a9299/x77WIVA+QvX89Y9zJt5iBatwtSHh/kPodxkAiy3p6TPJ
 Bf7xEK+dSJ+jTx2rSaxkbRRD4yRChbuVpZwxAdhOPrV8EajB/PGWsqgoEKc94mhZEuck+XiJy
 efjTpw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

since recent discussion raised the question about the future of debugfs
for vchiq [1], i want to submit this cleanup patch series as part of the
discussion and a small Halloween present ;-)

Best regards

Changes in V2:
- rebase on top of current staging-next
- address suggestion from Laurent Pinchart in patch 1
- fix checkpatch issue (too long line) in patch 2

[1] - https://lore.kernel.org/lkml/7ea529c2-3da6-47df-9b09-28d4ab36c4ef@ka=
dam.mountain/T/

Stefan Wahren (3):
  staging: vchiq_core: Make vchiq_dump_service_state static
  staging: vchiq_core: Shorten bulk TX/RX pending dump
  staging: vchiq_arm: move state dump to debugfs

 .../interface/vchiq_arm/vchiq_arm.c           |  94 ++----
 .../interface/vchiq_arm/vchiq_arm.h           |   7 -
 .../interface/vchiq_arm/vchiq_core.c          | 274 +++++++-----------
 .../interface/vchiq_arm/vchiq_core.h          |  16 +-
 .../interface/vchiq_arm/vchiq_debugfs.c       |  10 +
 .../interface/vchiq_arm/vchiq_dev.c           |  21 --
 6 files changed, 137 insertions(+), 285 deletions(-)

=2D-
2.34.1

