Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6A65262EC
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 15:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356231AbiEMNT0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 09:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346283AbiEMNTV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 09:19:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E0210FC3
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 06:19:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A5B9661F95
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 13:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F51C34114;
        Fri, 13 May 2022 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652447960;
        bh=KEM0h3K5ONRrlF7DOKpPKERxtTRsqMlXfO05OZO8zTc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fgoGQ/pVgqzNl08HQGyPsXGAQykJ5Q1bL01DkN7nXt4Vv3gxkwYuZT12IDSmkHzTW
         IxpdYZk1A89mE635WuJrzvod73IoH+lQu1g9j3lX0vysOsU3EizyuSzSuTw9AgJh+i
         dkklX1Z2I1UifIpNLYEp4Z9atH4wKujlW3HxJCgGnJE8FA0TsQ+OtdzBQG4zOUUpCd
         7v1JC0lB7C/qvDJCZHR5nHWi+89XJUncwBIlk92KrtMbeyvPey9z7IhSIIhmbKM32i
         9Tvtbjc9SqUpoobUKob/vnqB/bJLNpVqfiqpAyQP9ZNfGB9TdD/M+H6wBKr8VO3iyf
         OmcTULHsSmtRg==
Date:   Fri, 13 May 2022 15:19:15 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 5.19] Ov5640 driver improvements (#83198)
Message-ID: <20220513151908.60c01b50@coco.lan>
In-Reply-To: <20220513112018.3416321-1-jenkins@linuxtv.org>
References: <Yn41HyGCOJyZU98T@valkosipuli.retiisi.eu>
        <20220513112018.3416321-1-jenkins@linuxtv.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari,

Em Fri, 13 May 2022 11:20:17 +0000
Jenkins <jenkins@linuxtv.org> escreveu:

> 	../drivers/media/i2c/ov5640.c:205:12: error: =E2=80=98ov5640_code_to_bpp=
=E2=80=99 defined but not used [-Werror=3Dunused-function]
> 	cc1: all warnings being treated as errors
> 	make[4]: *** [../scripts/Makefile.build:288: drivers/media/i2c/ov5640.o]=
 Error 1
> 	make[3]: *** [../scripts/Makefile.build:550: drivers/media/i2c] Error 2
> 	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
> 	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: driver=
s] Error 2
> 	make: *** [Makefile:219: __sub-make] Error 2

Please fix this compilation breakage on this series.

Thanks,
Mauro
