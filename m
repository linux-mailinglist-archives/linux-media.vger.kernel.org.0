Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6D660CA5E
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 12:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbiJYKwM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 06:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232054AbiJYKwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 06:52:10 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39DE87FA0
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 03:52:06 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id e4so7504698pfl.2
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 03:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fkFgfXaqdgquVI7NKap7slqYaaQFBUcSMpcB4V0T548=;
        b=Q+C5jfhGTlV+0CycaedPDStrr2Y2IMHmbobgBp7DFZOrz3z6jiVjEa2HURaWqMDxI/
         nbBN0XwEHwFL/2DnNmTdoLm+Vor1UQtolwTv4ZukYiZvQtHV4AxZyCK1vRhZ46bDQUZ/
         Td9yDUu4dDwkcXZW4PqAZQiLY+HBXAmWJip4U24eHLn+7i6OTqvfMPFGEIBCbSeFRvfS
         yU7HCRGlrwz09NkJvmAujHT92fvrqvqa+cgQSCy9mjmnUj0LEb6uottAqjAeyGv7abMa
         MMkDqnGX1UYGMHR2u2G4aoYZkOVeaotLkyeM52rKU91vIeV4CbyVKYpKhRgtV6vP/8go
         3ipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkFgfXaqdgquVI7NKap7slqYaaQFBUcSMpcB4V0T548=;
        b=1jQshxLsA3t4Hfxr6ZlDMBD4dc5RKOmiWlC9lm1m6j2vPSPsSuQyR9rYp+FrS7KJJv
         LbpS0Xd/C6inrZo/EJ67cW09OVQfqSf2E9yEU630A3N9f9Q7p9UBuXCDZs53QtHKPIvZ
         bwwuoqVQd1YAwmCVmNZpVv3lD76Uv6Li9aKVYEy5B96gkkFkTdiRdODIFvXyZm7pHg9Z
         K+eTRx0xItahj9FJmIrUUnYSvjJJP5esYLFzmdM+oatSxym/ZgUrL7eVCuhT3oLVv2kg
         Cl+3yZ/FdZ4nih2suZBzrUQ71fYxGCwY4e/LrJ7JAYocoThpM1KuXaGaBbkYnq4vTYlw
         Kp3g==
X-Gm-Message-State: ACrzQf0NAKyKYDxRjnBSYrbnt2CKLG4N2/j4ntfPPHmMZ5y8I9lVTpkl
        EdBCjLCk82FMHzB2kKpCNUubemO1gPVR1YQVkGcnRQ==
X-Google-Smtp-Source: AMsMyM785sCKS3w4c9cdcxntZqWnMDoua0hVMWr5eI29Ibt4q88PZFK/VvBN+IuVz+ipSuEXgbxZX6rBpjrGPnQOg0g=
X-Received: by 2002:a65:6148:0:b0:458:88cd:f46 with SMTP id
 o8-20020a656148000000b0045888cd0f46mr32019568pgv.303.1666695126166; Tue, 25
 Oct 2022 03:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221025055528.1117251-1-yunkec@google.com> <20221025055528.1117251-3-yunkec@google.com>
 <Y1ezLUMVELC/J5ze@google.com>
In-Reply-To: <Y1ezLUMVELC/J5ze@google.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 25 Oct 2022 19:51:54 +0900
Message-ID: <CANqU6FdwC9yAMZOqv0wm2pZ+HTkLZHV+OkAK6x-95w2Baz-fUQ@mail.gmail.com>
Subject: Re: [PATCH v9 02/11] media: uvcvideo: add uvc_ctrl_get_boundary for
 getting default value
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 25, 2022 at 6:58 PM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (22/10/25 14:55), Yunke Cao wrote:
> >
> > +int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
> > +                             struct uvc_control *ctrl,
> > +                             struct uvc_control_mapping *mapping,
> > +                             struct v4l2_ext_control *xctrl)
>
> This should be static, as far as I can tell.

Ah, thanks!
