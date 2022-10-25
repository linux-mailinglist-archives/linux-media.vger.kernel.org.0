Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA7F460C963
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 12:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbiJYKG2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 06:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbiJYKF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 06:05:57 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69664183E24
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 03:00:13 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id e129so10998540pgc.9
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 03:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sydQgPztv3Y7pNThIVLDGNLC6M+AsCSE/wvUN/jbsDk=;
        b=mc4IC+2LUYwQVRmdaiJeOnEV7SYcZf54X8oUevwco3VdH6H+66MHs4U6kGDmCPin+n
         DmnQdZFFs0Zg+hfQPaCS+Vd5s1c50C47p5TtrYIBBGF5c5YKkwZKkuyiUSMgn8NJ/aE1
         OVY/HBocrOiKD46JsP3XQmfBtwR3tFRtJt5p0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sydQgPztv3Y7pNThIVLDGNLC6M+AsCSE/wvUN/jbsDk=;
        b=PsTg6DfOa/L57ziFfHlXd3WLYtQlb8BETPW8hGqbN9mMfGqfRWsWCFcFr7TmzFpa+t
         VFQejltxyewfc4quE4Ud3FgCSZxIraAuy2e2fdv5XxTHhIDp66eC/5T4U2dnz6rgfAaK
         qC9E0Ig3/mKJZZzB0n2j0kCpHUGFzwncGwtKS05dSB+tAAiVQsSG3Lb6LspYP/3y7R9q
         kM2iqr8YAuLtI1PbNcrvdvFaWN6JlvfOHW4vXrTC9AfKZEJzf41b8l0UgPOHfJ+1EL6m
         F7R5nVxhLrDWC7vD0KgTGD2Xwn00wmd/fVrmuCKol0BGVRmRv4HdlFQsZkUahMs9xRUm
         uUmA==
X-Gm-Message-State: ACrzQf0EIxdreCLdm1j73fCct8dS4mfa3FIsuRLWRBLVq2BsBoNOTanY
        vjbmwS1Q9cSFcHBEi5JUDMRJiQ==
X-Google-Smtp-Source: AMsMyM4CBXP0fKKQezoCIqEEQfwPk4fGVwOn3lTjdr2kz8Wq5XToAxvQK7uoi5UIJ8BzoGBbvRQong==
X-Received: by 2002:a63:1e47:0:b0:43c:261f:f773 with SMTP id p7-20020a631e47000000b0043c261ff773mr32407067pgm.1.1666692012954;
        Tue, 25 Oct 2022 03:00:12 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:c493:65a6:2d64:1325])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902bd8e00b0017e232b6724sm952139pls.69.2022.10.25.03.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 03:00:12 -0700 (PDT)
Date:   Tue, 25 Oct 2022 19:00:08 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v9 05/11] media: uvcvideo: Add support for compound
 controls
Message-ID: <Y1ezqGisxodvFJvy@google.com>
References: <20221025055528.1117251-1-yunkec@google.com>
 <20221025055528.1117251-6-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025055528.1117251-6-yunkec@google.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/10/25 14:55), Yunke Cao wrote:
>  
> +int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
> +			    struct v4l2_ext_control *xctrl,
> +			    struct uvc_control *ctrl)
> +{

Also should be static?
