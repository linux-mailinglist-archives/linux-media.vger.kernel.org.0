Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85BA264CE34
	for <lists+linux-media@lfdr.de>; Wed, 14 Dec 2022 17:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238893AbiLNQjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 11:39:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238711AbiLNQjH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 11:39:07 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450445FEF
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 08:39:06 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id s196so2355053pgs.3
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 08:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LbDNBydaewl5dltimDBqmtpJAJq+VfTZXoANK7KfgaM=;
        b=FfGyrKw/pmdyACIFzyBjx3+I1RbAhXpY1KnMvcvd+IcY08hb1o4LUYI2jEIuzO+mFU
         IgAhBi3hP4RrTENiY/AvN82n/S44+iEqYaPvULsrJ9dxTtrbC/XbDwJFSvm5WCy2qF6i
         0OIdfwcoq7wp6CwHFi6W5FtXCOO4Glo8XLi1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbDNBydaewl5dltimDBqmtpJAJq+VfTZXoANK7KfgaM=;
        b=t1kqHm3iAwhlc/bPr5Q/ED1K+D29GiqhIDtUrMySegl5YLHTA8uu0K5hpJ7wGdBPHJ
         PiNHzZRb/YR7kgBIFqYngwY2Id8O4v8IyAzKConGtn3njFrmBI3xarC2QFbFq77r5lK+
         DhlaDhFeHxcF301kCeRwe6XHUQPj4d6wgc4BFVuG2VjtsR0/pLxbPxBq5+yAGXB0uJcv
         bZFOtqwD28lsabPOKXQ+Xun3V20e20KoI9Mxux4c0moa1KDjR/ZKD2WS5P4M28VI08pj
         sz3zIafWNR3Db0PiSA/vJIyEKiloCP8KwZt6JZA2YjyrkHAWF2boX41XqdUzS+zwz8IX
         ugLQ==
X-Gm-Message-State: ANoB5pl+QxRBaaR80yno3j0GVStnTSCrbVr5TLqEBSB6itl2A4fEKnlo
        v9HOLsy/gr+XVuEF3Q9142OIwuX0UlDgGaoc5GA=
X-Google-Smtp-Source: AA0mqf6/lSzgg3p10RcRb8rRI/oBtpXFQRT1iPPyEZvrNuRhbbgvfK5y11goE3IzdXp2BygXf6WyrQ==
X-Received: by 2002:a05:6a00:290e:b0:56b:6821:487a with SMTP id cg14-20020a056a00290e00b0056b6821487amr24932961pfb.22.1671035945568;
        Wed, 14 Dec 2022 08:39:05 -0800 (PST)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com. [209.85.214.178])
        by smtp.gmail.com with ESMTPSA id y64-20020a626443000000b005768cdc66b1sm85636pfb.131.2022.12.14.08.39.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 08:39:04 -0800 (PST)
Received: by mail-pl1-f178.google.com with SMTP id a9so3895054pld.7
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 08:39:03 -0800 (PST)
X-Received: by 2002:a17:902:ce04:b0:174:af35:4b90 with SMTP id
 k4-20020a170902ce0400b00174af354b90mr79455890plg.8.1671035943448; Wed, 14 Dec
 2022 08:39:03 -0800 (PST)
MIME-Version: 1.0
References: <20221212-uvc-race-v3-0-954efc752c9a@chromium.org>
 <Y5nEgDOXFNDPf8/Y@pendragon.ideasonboard.com> <CANiDSCvLjr6NK3pL9NpLap44Zcc22OEbyRANXq90dtG+udro4Q@mail.gmail.com>
 <Y5nP1RXbd7mCkmCD@pendragon.ideasonboard.com>
In-Reply-To: <Y5nP1RXbd7mCkmCD@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 14 Dec 2022 17:38:52 +0100
X-Gmail-Original-Message-ID: <CANiDSCsHR2DNPNRkDNELSJcUqUbtxwGY_Rie=3o0NUF+qzDr7g@mail.gmail.com>
Message-ID: <CANiDSCsHR2DNPNRkDNELSJcUqUbtxwGY_Rie=3o0NUF+qzDr7g@mail.gmail.com>
Subject: Re: [PATCH v3] media: uvcvideo: Fix race condition with usb_kill_urb
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Max Staudt <mstaudt@google.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yunke Cao <yunkec@chromium.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Wed, 14 Dec 2022 at 14:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> > > Isn't this still racy ?
> >
> > Indeed...
> >
> > I could add a mutex just for flush_status
> >
> > what do you think?
>
> It may be possible to avoid that. I'm giving it a try.

Just sent a new version without lock...





-- 
Ricardo Ribalda
