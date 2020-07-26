Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40BAB22E313
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 00:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgGZWRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 18:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgGZWRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 18:17:03 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F8AC0619D2;
        Sun, 26 Jul 2020 15:17:01 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id 2so9575324qkf.10;
        Sun, 26 Jul 2020 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6Po5jgD/fTz0bRHehR/lWSrKrlH1nrDPT2JvC+xllTY=;
        b=Lx4HT5NID57037yokxvkZPUjrE/D90unh+sBukejVAmsIq7RoqYVpY0WwIokIWNyMw
         CQxqKXt8a4bfHf3Sx5qfEvXWUidDR1hAN3RT2jx+5BK4Agb93fzf3HGT9NhxX3zNcIsb
         e+PGMYXqBMEitk7OqxzkbvwEspBjp9c05jbSuOOt9+XREApVDHwwMt4+TNRDK3b+UyWj
         qZ/TQRhsB7llNg+QjqyyNGS3fjrf4IY0J+X1f8TAYSV1vuOI9osOMOZIL+v4x0VDaARz
         akj+B+PvQRRLUURVw5eArC8o7cPVk1CJua7U8tib/CcpGvK5GajxewWWzRv3CY3WlwB0
         1fXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Po5jgD/fTz0bRHehR/lWSrKrlH1nrDPT2JvC+xllTY=;
        b=cgHwD1UZOW6F0tdg3ckW4qqrDboH3z0uE7VIsqLj6UA9/PTNiU2IcgzbFRbGsmAmDI
         MeVDip84fDMhSYBs2419dcIR3fOAYDDU04g3Huvx7Xu2qubEqVG3U+MnXE9j7ufmjmBs
         sueHo8u9Snc3OOAcZ2tp0ttgF+R0x3kw8NLnNkVAJmrhcZ0zHV7XGl2R3aciOdj25iY0
         IAZXxJajDMqspkitghuv3XbN+N2nXGlS7ubwlnPeAIeM6W+ve4IW46bVxcKMDRcP5B5E
         5/YNBYCtI95ZCRUGzcWrjDIWJgxmpfEoOM2fzXYI1wEgnyeT8gEN/akBPahQfU/X/hE8
         ecsQ==
X-Gm-Message-State: AOAM530unnVIitFPYTnsMxyb2fCNDJI5R0YfWZdRoOCQaW3V52Ve1pxa
        sXv8pz8tJkSp/mOVFpK7eg==
X-Google-Smtp-Source: ABdhPJycW1/dNpTwFlADTGfxlc4/sQ6jWQQLjQA4Qrfjhby3OJXoi3cgIp6aV4mU43x6Zeo2pFglXw==
X-Received: by 2002:a37:4cd4:: with SMTP id z203mr20156401qka.399.1595801821047;
        Sun, 26 Jul 2020 15:17:01 -0700 (PDT)
Received: from PWN ([209.94.141.207])
        by smtp.gmail.com with ESMTPSA id i65sm1780394qkf.126.2020.07.26.15.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:17:00 -0700 (PDT)
Date:   Sun, 26 Jul 2020 18:16:58 -0400
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
Message-ID: <20200726221658.GB102357@PWN>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
 <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726221056.GJ28704@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726221056.GJ28704@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 01:10:56AM +0300, Laurent Pinchart wrote:
> Hi Peilin,
> 
> Thank you for the patch.
> 
> On Sun, Jul 26, 2020 at 06:05:57PM -0400, Peilin Ye wrote:
> > video_put_user() is copying uninitialized stack memory to userspace. Fix
> > it by initializing `ev32` and `vb32` using memset().
> 
> How about mentioning that this is caused by the compiler not
> initializing the holes ? Maybe something along the lines of
> 
> video_put_user() is copying uninitialized stack memory to userspace due
> to the compiler not initializing holes in the structures declared on the
> stack. Fix it by initializing the structures using memset().
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I see, that makes sense. I will send a v3.

Thank you,
Peilin Ye
