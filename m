Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1D1508069
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 07:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359382AbiDTFKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 01:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359377AbiDTFKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 01:10:00 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A0228E20
        for <linux-media@vger.kernel.org>; Tue, 19 Apr 2022 22:07:13 -0700 (PDT)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220420050708epoutp0496c7f8afaa4595d9afdcf57480831f2a~ngnUqpXmu1839418394epoutp049
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 05:07:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220420050708epoutp0496c7f8afaa4595d9afdcf57480831f2a~ngnUqpXmu1839418394epoutp049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1650431228;
        bh=Y4SM9aJVXKRHd9dzvU2d8pbeC9IGkqW2YmNbHgTzgeE=;
        h=Subject:Reply-To:From:To:CC:Date:References:From;
        b=EpYjohelBPoxrg/9tU32t4QQybV9IPLNNVPSXt9U057zRf8f8Nm7iQU5dsgUqbmKh
         IpHl5/t/QcYISFwKYL9flSEmiSV52t5i6cw7OPDfBtJTbZ4c/ONkvEVhTGgY1/pm37
         hbEqRKbjab/AWOCSr02z4FRFzLQKDe+YWAK+Cfeg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20220420050707epcas1p3afae3a47ce4029475c5047b759ae5946~ngnURXrGn2921629216epcas1p3H;
        Wed, 20 Apr 2022 05:07:07 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.36.135]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4KjpZ2445Xz4x9QV; Wed, 20 Apr
        2022 05:07:06 +0000 (GMT)
X-AuditID: b6c32a39-003ff70000006fe8-c1-625f94fa058c
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        76.56.28648.AF49F526; Wed, 20 Apr 2022 14:07:06 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH] media: exynos4-is: Fix compile warning
Reply-To: k.son@samsung.com
Sender: Kwanghoon Son <k.son@samsung.com>
From:   Kwanghoon Son <k.son@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        ALIM AKHTAR <alim.akhtar@samsung.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20220420050706epcms1p2c627fe5d8f434a204e554048626a6e63@epcms1p2>
Date:   Wed, 20 Apr 2022 14:07:06 +0900
X-CMS-MailID: 20220420050706epcms1p2c627fe5d8f434a204e554048626a6e63
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLKsWRmVeSWpSXmKPExsWy7bCmru6vKfFJBkt2y1k8mLeNzWLv663s
        Fj0btrJazDi/j8li2aY/TBaH37SzOrB5bFrVyeZx59oeNo++LasYPT5vkgtgicq2yUhNTEkt
        UkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAFarqRQlphTChQKSCwu
        VtK3synKLy1JVcjILy6xVUotSMkpMC3QK07MLS7NS9fLSy2xMjQwMDIFKkzIzpjR/52tYANv
        RVfrQ5YGxibeLkYODgkBE4mdvxK7GLk4hAR2MEo8/vKYDSTOKyAo8XeHcBcjJ4ewgLnExEtH
        2EHCQgLSEh8u6oKYwgKaEs87HEEq2ATUJZa0rWUHmSIicIJR4s66ySwgDrNAF6PE/RnLWUGq
        JAR4JWa0P2WBsKUlti/fyghhi0rcXP2WHcZ+f2w+VFxEovXeWWYIW1Diwc/dUHEpidYz25kg
        7GyJmTNWQsVLJPbvmcgM8Za+xLFt0iBhXgFfiW97joCVsAioSrRN2Qx1govE4o3zwGxmAW2J
        ZQtfg7UyA/21fpc+RImixM7fcxkhSvgk3n3tgftkx7wnTBCb5CVudZbDHH/m6Uc2CNtD4tHs
        1WBPCQkESvzsuMw6gVF+FiJoZyHZOwth7wJG5lWMYqkFxbnpqcWGBabwyEzOz93ECE53WpY7
        GKe//aB3iJGJg/EQowQHs5IIb8+S6CQh3pTEyqrUovz4otKc1OJDjKZAH09klhJNzgcm3LyS
        eEMTSwMTMyNjEwtDM0Mlcd5V004nCgmkJ5akZqemFqQWwfQxcXBKNTBFfPUoSitcq7/Jgtdk
        37d0j3f2mxWazlmo+Tz/oDHBpMraX6j/YsKpbcEri6936G04qvtfhIEzJHKLIKtYgLF6pFZ4
        V9Xp7OoFcUfmp+tIRKpnLf/YVlR27/QLP7Fcm/UV0Qd8wzpXq2a/23Lw4u5N6fc+v3njO194
        m9A/NmsNgSvcSX7lIkcuP95846TYshytk648VplsYROD+z4F/vzy9L7RtKcXXz/+OdO5aZ30
        3JMn3FTWOW5qfWq8sX3po1i2GVfuBU2Ydixiyf+XqrxPvl6a/MN70xTunrInnQfWPT3M2WJr
        +a5+4oW4BbxX126cITJp6rY8P/9DBcKmH6U95yo/kmqa/d6t31T2soWdEktxRqKhFnNRcSIA
        5S5VHQAEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220420045732epcms1p7bdaf82873a4328153b456ee4e3a5660a
References: <CGME20220420045732epcms1p7bdaf82873a4328153b456ee4e3a5660a@epcms1p2>
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SCC_BODY_URI_ONLY,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

declare=C2=A0'static'=C2=A0to=C2=A0fix=C2=A0warning=C2=A0message=C2=A0from=
=0D=0Ahttps://lore.kernel.org/linux-media/202204192315.ZHbOex51-lkp=40intel=
.com/T/=23u=0D=0A=C2=A0=0D=0AReported-by:=C2=A0kernel=C2=A0test=C2=A0robot=
=C2=A0<lkp=40intel.com>=0D=0ASigned-off-by:=C2=A0Kwanghoon=20Son=C2=A0<k.so=
n=40samsung.com>=0D=0A---=0D=0A=C2=A0drivers/media/platform/samsung/exynos4=
-is/fimc-isp-video.h=C2=A0=7C=C2=A02=C2=A0+-=0D=0A=C2=A01=C2=A0file=C2=A0ch=
anged,=C2=A01=C2=A0insertion(+),=C2=A01=C2=A0deletion(-)=0D=0A=C2=A0=0D=0Ad=
iff=C2=A0--git=C2=A0a/drivers/media/platform/samsung/exynos4-is/fimc-isp-vi=
deo.h=C2=A0b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h=0D=
=0Aindex=C2=A0edcb3a5e3cb9..2dd4ddbc748a=C2=A0100644=0D=0A---=C2=A0a/driver=
s/media/platform/samsung/exynos4-is/fimc-isp-video.h=0D=0A+++=C2=A0b/driver=
s/media/platform/samsung/exynos4-is/fimc-isp-video.h=0D=0A=40=40=C2=A0-32,7=
=C2=A0+32,7=C2=A0=40=40=C2=A0static=C2=A0inline=C2=A0int=C2=A0fimc_isp_vide=
o_device_register(struct=C2=A0fimc_isp=C2=A0*isp,=0D=0A=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return=C2=A00;=0D=0A=C2=A0=7D=0D=0A=C2=
=A0=0D=0A-void=C2=A0fimc_isp_video_device_unregister(struct=C2=A0fimc_isp=
=C2=A0*isp,=0D=0A+static=C2=A0inline=C2=A0void=C2=A0fimc_isp_video_device_u=
nregister(struct=C2=A0fimc_isp=C2=A0*isp,=0D=0A=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0enum=C2=A0v4l2_buf_type=C2=A0type)=0D=0A=C2=A0=7B=0D=
=0A=C2=A0=7D=0D=0A--=C2=A0=0D=0A2.20.1=0D=0A=C2=A0=0D=0A=C2=A0=0D=0A=C2=A0=
=0D=0A
