Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E452543AFA
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 20:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbiFHSAc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 14:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233489AbiFHSAa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 14:00:30 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7751F5537B
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 11:00:29 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u23so34407266lfc.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jun 2022 11:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UGgFHfS/WYYMpxFPAEHv/7TtNrEwauDJkH6EB0+84S8=;
        b=Suq2IzJvgGApWY0D3uJFtAZx0c0yakDCl8hHI4sE22k7BKhM+epXv6Y5XcKk34hi9W
         629T2mjELPMOYie6tr0v8BlYfDH05DMjA84W+XxM6AORohUZzFFQCkjtN+UxQNEQNqAn
         1RL6Q6mLbpYPR6osC96Vtd+2/9jKfamJpDY80o8cPUf7a9t+MHb53a8hi2HMmhdR94Do
         hwbLFM5k9I9KK8a4mzS05ankcV+bFfu8LCDzqP/WOMLRIvAxCapCalCK84ButQ92W6Oc
         EvajnxPjIBfzHps+89xUyldixLE78Rzs42yMYqedJUKsK6aPUEY5jIG+oX+GM4VIRX5L
         D13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UGgFHfS/WYYMpxFPAEHv/7TtNrEwauDJkH6EB0+84S8=;
        b=Qs96YJyua+pQaz13JIwBd/YPMqSbWFBr90JGJ7oRvSGCnezY+iE8fO/kEZOHPd6XDs
         GYzAse4TXei9AvVBb/WbFiqxTxEoDuTlaFEjSi7e+Zzi0wb4/JjP8xBTH/A4jsi6S4WR
         mmAOVYn1IAi3M8A1vynVZBPbyBcPidX3TsBmyUK9+NXaSmNrSStHKixkPcmy5Qtd/TP9
         3hXZUz4PwncluKN2q3s9DYCMhfzFDUguTpOVOwa33KAu/J6lBUlbe8JxngJoArYlSQq9
         l1lJ0XJpGMJVGSEVBufZVrrz/gUmzn6SOpxiIAOsz8ZApt5hj5dpARn1z9a05TtVNAob
         kBQA==
X-Gm-Message-State: AOAM531aFRy3TfblG7KF+DSGweKeOHBPH2NVSx3aZNc9n4G/rlCXuwSq
        yeNYmMOW+UGlABxC0CUARIX1QA==
X-Google-Smtp-Source: ABdhPJztTD8ERZe54JbHTCdPrNeLXNIeq32qLP1Z8puKQAWw2S+btHQRoAW4xUjI7GEbCusNSNH91Q==
X-Received: by 2002:ac2:4c42:0:b0:479:6f07:8f83 with SMTP id o2-20020ac24c42000000b004796f078f83mr4645804lfk.634.1654711227784;
        Wed, 08 Jun 2022 11:00:27 -0700 (PDT)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id h16-20020a2e3a10000000b002556d356a1esm2516507lja.140.2022.06.08.11.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 11:00:27 -0700 (PDT)
Date:   Wed, 8 Jun 2022 20:00:26 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] media: rcar-{csi2,vin}: Move to full Virtual
 Channel routing per CSI-2 IP
Message-ID: <YqDjuoUYK7g6WGII@oden.dyn.berto.se>
References: <20220124124858.571363-1-niklas.soderlund+renesas@ragnatech.se>
 <20220124124858.571363-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUvtGKnL=bzty4wYoCJ3vqm0PYunJV1jwyYUwB84mQusQ@mail.gmail.com>
 <YqCXzX+rpFb5V03n@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqCXzX+rpFb5V03n@oden.dyn.berto.se>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi again,

On 2022-06-08 14:36:31 +0200, Niklas Söderlund wrote:
> Hi Geert,
> 
> Thanks for your bug report.
> 
> The issue looks to be related to the nested V4L2 async notifiers. I 
> tried to recreate the DT setup on M3-N but failed to trigger the issue.  
> I will try to get hold of an Ebisu board and try to trigger the issue 
> and get back to you.

For the record fix posted here [1], thanks again for reporting this!

1.  https://lore.kernel.org/linux-media/20220608174446.994823-1-niklas.soderlund+renesas@ragnatech.se

-- 
Kind Regards,
Niklas Söderlund
