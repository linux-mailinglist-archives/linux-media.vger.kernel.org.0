Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055F07751C5
	for <lists+linux-media@lfdr.de>; Wed,  9 Aug 2023 06:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjHIEEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 00:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjHIEEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 00:04:30 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114AF1986
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 21:04:30 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-686b643df5dso4470408b3a.1
        for <linux-media@vger.kernel.org>; Tue, 08 Aug 2023 21:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691553869; x=1692158669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NrVp1jDmwrDvr4OTz+PTItqUNwIKfiRztkLayBKMM4E=;
        b=RgarN0QgsrvWqiZ6K8o3D5L7+YEDVR84S/iCyXNq6ox/klmTXr0soOSaHyQUBKoXS3
         1RkK0BN1r9ILG8JLdHEK+iBZRvisl5uxdHN8DIu5sza7R+Go3La6gcrLr618rUvHUGZs
         k8AEGtjxpuqoEImeQw8+HGdLaWC+1rwcIq+7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691553869; x=1692158669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrVp1jDmwrDvr4OTz+PTItqUNwIKfiRztkLayBKMM4E=;
        b=eg+hmepcmr7FZT880JVmk+xe70PpBxKlh8dJOKt6z59DWevRfTRtXoOVXXPmMajHBP
         kphJ7g9qeZgXhGyIs43U/zESJa5oQNZWfZqFLZTak/Py43jSemce9fVj2r7X9uiruxC1
         S8Jfyxej70AuYBp1/kFHCFttOjjolP5c3NKtoZgDKShp8AUdWzdHkRUY42FOB/j+C8CI
         3cecJCbsIAv3cgvyOFWX1B8UNpIFIBVIaIGP1UrN2NlT6lzwAoPCBJlpxW22M1F+Tzy5
         Ew3Z67sSu3qSkkjihu0nnYv/erTOevqRAXWyG2hL6FhJW4v8FE56ATW/qIcyNhqhaOy8
         ovAQ==
X-Gm-Message-State: AOJu0YwZjS/SGgpCXWvZgk5Hogts8M20V1mReK6TvSZuTqYH5infs1BX
        TrCnVAA+JC7tf6kW3GkDY1JLmonMGCTByngz8A0=
X-Google-Smtp-Source: AGHT+IGBoD9wlCXJGgqFMeXoN+jQmkDUmd0KcW0HMfGjPtgSRl0FBSK+2gflfdhfSZkte9h+owl3VA==
X-Received: by 2002:a05:6a00:2301:b0:687:40bd:561 with SMTP id h1-20020a056a00230100b0068740bd0561mr1562114pfh.20.1691553869509;
        Tue, 08 Aug 2023 21:04:29 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:fdf2:7f85:e85a:4c61])
        by smtp.gmail.com with ESMTPSA id f12-20020aa78b0c000000b0068790e58edfsm8837062pfd.56.2023.08.08.21.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 21:04:29 -0700 (PDT)
Date:   Wed, 9 Aug 2023 13:04:25 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>,
        Yunke Cao <yunkec@google.com>
Subject: Re: [PATCH v11 00/11] media: Implement UVC v1.5 ROI
Message-ID: <20230809040425.GA681074@google.com>
References: <20230426082923.132909-1-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426082923.132909-1-yunkec@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/04/26 17:29), Yunke Cao wrote:
> Hi,
> 
> This patch set implements UVC v1.5 region of interest using V4L2
> control API. I rebased v10 and resended.
> 
> ROI control is consisted two uvc specific controls.
> 1. A rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
> 2. An auto control with type bitmask.
> 
> V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.
> 
> Tested on two different usb cameras using v4l2-compliance, v4l2-ctl
> and calling ioctls.
> 
> 1/11 adds V4L2_CTRL_TYPE_RECT.
> 2/11, 3/11, 4/11 refactors uvc_ctrl.c.
> 5/11 adds support for compound controls.
> 6/11 is a cherry-pick for Hans' implementation of
> V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-core.
> 7/11 documents min/max for the rectangle control.
> 8/11 supports MIN/MAX in UVC.
> 9/11 implements ROI in UVC.
> 10/11 initializes ROI control to default value.
> 11/11 documents the changes.

Hello folks,

Can we please get some reviews/feedback on this?
