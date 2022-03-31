Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B76A4ED91B
	for <lists+linux-media@lfdr.de>; Thu, 31 Mar 2022 14:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234491AbiCaMDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Mar 2022 08:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236146AbiCaMDM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Mar 2022 08:03:12 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2312D6574
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 05:00:40 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id k15so23278916vsr.11
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 05:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n7p8Uq2+lZWPYal2atoqxtilGwC7bZj30FTcIre8js8=;
        b=bqEyU9czIxM2OrF6DA/wE3J8vr9cBJZA2LzCfiKSISgPpa/TESqOK2qL3GirYtGp2w
         /nJdRX66BTMYmHxSx7yLAaqFDcUn+k2AVJ2TMql0zuwajox5QXagtYTxQvv1SVHCAjc8
         ShvNbrSsyz9ZNLPs1cq1xIDOn5v+MqS/7ApKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n7p8Uq2+lZWPYal2atoqxtilGwC7bZj30FTcIre8js8=;
        b=zX0HORHF2+Pd1jP2zPiJ6ecKcU1pdDsItL1t2CRdDiRSWUAX0jutdtdcAc+gQBnlLw
         IXe5G2KUIlxebdVALDMGhCSQy7Db61zVl4NAcsi9WoEKLgGpVqYY/KcDP+ek+mLrWXSI
         dw0bie9bef81WPVf/uR0D8d70sJ07YjkOQa/R+09kJdATScgjgyQFyuXv0xNzIM3aXqC
         BL6SqzEBIc+WL/8vJ0v8CTcTSQS6igiOOMJgSXCFAPhnYakfP5ZQi/ORQxa0ZhostVzD
         cuVKkkv8SJlJjPlI6gVe4N4TGYL/CkBVhfbjUrd1mKXmICNEWAVAWuGxClfhME/3FA6D
         VdQA==
X-Gm-Message-State: AOAM5301Yftn32lG6PkzGIkyT8ULk/IflTcFadfex+aNTvJVpzb36dym
        lHFjm+Hjky6vQQrxiNMUGlTqm/ijFUoExpd3XlT7Nw==
X-Google-Smtp-Source: ABdhPJwDM4xS5vEd9KdONZjoeyi4xmvPxFKo/aadxZWwYA48QQoGh1IvN+jWltCA/JbpwdWTlMNjWUsabNEmni0bYmw=
X-Received: by 2002:a67:fd0b:0:b0:31b:e36d:31b1 with SMTP id
 f11-20020a67fd0b000000b0031be36d31b1mr1587242vsr.44.1648728039267; Thu, 31
 Mar 2022 05:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <SL2P216MB12463DE2E1E100E2498A5C33FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <SL2P216MB1246D7900A0B9620F1E1A038FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <YkWRN4ac0ivRn4aB@kroah.com> <CAFr9PXm3Mvr0guGoPDKmashMhFG6OQMvXHxwX-SD5ZHPi_sw4g@mail.gmail.com>
 <YkWV6HGkGHvgSwCj@kroah.com>
In-Reply-To: <YkWV6HGkGHvgSwCj@kroah.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 31 Mar 2022 21:00:28 +0900
Message-ID: <CAFr9PX=s0CRtcVw_5xk7F6MRZ+svFK_cUDRzdaOFxcPGe4tBmA@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] staging: media: wave5: Add TODO file
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nas Chung <nas.chung@chipsnmedia.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "dafna3@gmail.com" <dafna3@gmail.com>,
        "bob.beckett@collabora.com" <bob.beckett@collabora.com>,
        "kiril.bicevski@collabora.com" <kiril.bicevski@collabora.com>,
        "lafley.kim" <lafley.kim@chipsnmedia.com>,
        Scott Woo <scott.woo@chipsnmedia.com>,
        "olivier.crete@collabora.com" <olivier.crete@collabora.com>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,

On Thu, 31 Mar 2022 at 20:52, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> According to the text in this driver, it will not work on these hardware
> as it is broken.  Unless that text is incorrect?

I think that's for risc-v.
The other chip this is in is ARM Cortex A7. The crusty vendor linux
BSP for this chip manages to play videos using it so it does work in a
real piece of hardware.

Cheers,

Daniel
