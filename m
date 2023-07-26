Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE32D7637DB
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 15:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232754AbjGZNnn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 09:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234262AbjGZNnZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 09:43:25 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D972720
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 06:43:20 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-686ba29ccb1so688944b3a.1
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 06:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690379000; x=1690983800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I5IHvw0DhgvWeevz+gNr6F5rd4gYnHIVm1kVUjPD3Tg=;
        b=nGzWk+Q1lMiVgF70MVC0quz0q/1zICB2LPuNrCtYNFuwXhsi/xIhp7/ilpc91OmByh
         a6V+xNsRWrNgm3FF/qJK0v27UWAZUwq/iV7x1ogMSZLoEWVjnkbxLymecPnfSEX1Q6NG
         evW4FO0OMWQrUeRJCCwpLMc+KIQwEMhu+p0cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690379000; x=1690983800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5IHvw0DhgvWeevz+gNr6F5rd4gYnHIVm1kVUjPD3Tg=;
        b=PR6aMwhSbb9CVzg4c8Yw+goEneTcXfqh7B2EWoxZXd5oD5JuqsH3hIsMbOEValx5wU
         R/u7gpiu2OLh+hFmiQZnMBx59/lMPIn76fJgAVtgslgGuQlBhj3f1/1sPQ30pPtAUQ9e
         ZFvWiq5UHfsovleJD069IKozzQlUOCUIroc2gqu3hHzk8L7JJ2vIpS7X8vjusZSFcywi
         8JyMQOJTPafOQkHfe+07v16xtyjw8OdzWsXK2/aU4tCErwK2oUpYJw9BmGGqv5Ce3AeQ
         hmlbfTr4o4xNudtcj54T7DhXEz6lYudW1ETKrbB70ejSEi1ZV2cu/poiAbpYieN4WnJq
         GS/w==
X-Gm-Message-State: ABy/qLZwtvTE9jeyNmM0FMbtR/GT6tknPuiUUHCwYgoSw8KQCExFnLTP
        GxxVPdBS3cTqjxbArrXCqtuAGA==
X-Google-Smtp-Source: APBJJlFRh7UeEFfF0sWfa4jdZHQMbwCXZ/ASd7bNDMcSgUCgpCO3cNZ5t3n1SgAHy0W9FzVN695kcA==
X-Received: by 2002:a17:90b:120c:b0:268:21c3:4fd8 with SMTP id gl12-20020a17090b120c00b0026821c34fd8mr2625877pjb.20.1690379000330;
        Wed, 26 Jul 2023 06:43:20 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b578:70e8:c6b4:a57b])
        by smtp.googlemail.com with ESMTPSA id s14-20020a17090a760e00b00267f7405a3csm1271902pjk.32.2023.07.26.06.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 06:43:19 -0700 (PDT)
Date:   Wed, 26 Jul 2023 06:43:14 -0700
From:   Zubin Mithra <zsm@chromium.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        stable@kernel.org,
        Kai =?iso-8859-1?Q?Wasserb=E4ch?= <kai@dev.carbon-project.org>
Subject: Re: [PATCH v2] media: uvcvideo: Fix OOB read
Message-ID: <ZMEi8jf0gjR57Vjw@google.com>
References: <20230717-uvc-oob-v2-1-c7745a8d5847@chromium.org>
 <20230725213451.GU31069@pendragon.ideasonboard.com>
 <CANiDSCttkqows7PZS823Jpk-CqK9Gz2rujF_R4SPDi=wcPJ2LA@mail.gmail.com>
 <20230726080753.GX31069@pendragon.ideasonboard.com>
 <952fb983-d1e0-2c4b-a7e8-81c33473c727@leemhuis.info>
 <CANiDSCvVag+sW5JDTKAPuML_-+6xHWgF+NeKoBKSd5MMr1Yiag@mail.gmail.com>
 <ab557ae6-7550-189a-81dd-6e3346d84620@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab557ae6-7550-189a-81dd-6e3346d84620@leemhuis.info>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 26, 2023 at 10:47:46AM +0200, Thorsten Leemhuis wrote:
> On 26.07.23 10:38, Ricardo Ribalda wrote:
> > On Wed, 26 Jul 2023 at 10:33, Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >> On 26.07.23 10:07, Laurent Pinchart wrote:
> >>> (CC'ing Kai and Thorsten who have added the check to checkpatch)
> >>>
> >>> On Wed, Jul 26, 2023 at 08:24:50AM +0200, Ricardo Ribalda wrote:
> >>>> On Tue, 25 Jul 2023 at 23:34, Laurent Pinchart wrote:
> >>>>> On Thu, Jul 20, 2023 at 05:46:54PM +0000, Ricardo Ribalda wrote:
> >>>>>> If the index provided by the user is bigger than the mask size, we might do an
> >>>>>> out of bound read.
> >>>>>>
> >>>>>> CC: stable@kernel.org
> >>>>>> Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
> >>>>>> Reported-by: Zubin Mithra <zsm@chromium.org>
> >>>>>
> >>>>> checkpatch now requests a Reported-by tag to be immediately followed by
> >>>>> a Closes
> >>
> >> Not that it matters, the changes I performed only required a Link: tag,
> >> which is how things should have been done for many years already. It
> >> later became Closes: due to patches from Matthieu. But whatever. :-D
> > 
> > I prefer to leave the Reported-by and remove the Closes, that way we
> > credit the reporter (assuming they approved to be referred).
> > 
> > But if that is not possible, just remove the reported-by. A private
> > link is pretty much noise on the tree.
> 
> Yeah, of course that's the right strategy (Linus made it pretty clear
> that he doesn't want any private links) in case the reporter okay with
> the Reported-by. Sorry, forgot to cover that case in my reply.
> 

I don't have a preference either way. Please feel free to remove the
reported-by tag.

Thanks,
- Zubin

> Ciao, Thorsten
