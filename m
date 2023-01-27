Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFCF267E5A2
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 13:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234212AbjA0Mma (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 07:42:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234220AbjA0MmT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 07:42:19 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C415674A63
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 04:41:56 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id t18so4882273wro.1
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 04:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X8sLEHpABmelP9Xrr4tNzmYgP5QTR2exVVWmUeftg6M=;
        b=dhHZQyl8+tFCN4Ujzz1O7hn5vpSJZ61UsHzHzf93pnMWzTpkx8QYS6oxBMtUjqteTH
         zTttqJlVevidzVnvsDSb933qmepj2eJhVga73s0oubkAzSuFShQAM7bBRXQpgN0sB6ks
         Pg8hh5RhoaV1N7Yjk3/TQLmMeSvtC2Oxbzj46eJtkahDz4PnsXnDY58M3+5T/gQjrMmo
         6f3QIdP+pkK+EqQO0lPHfo2YxOGwxJTNrarkB1MfXyHZgHGskDXV/fwVyXI+AhqTCShX
         QPWcs9Ujxr36vLWw8VQI7s6gnYcGrX/1Q5Ow7+qL2qe3tLtgXfB6PoHpNNO2evOvqH9N
         Ti6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8sLEHpABmelP9Xrr4tNzmYgP5QTR2exVVWmUeftg6M=;
        b=Z93g/jGErx88fQnX/2HaYTWTt/Vt+Fw+rn3q7fcgAhNHBgmAiAxNIraA4S7J82A2kn
         rgXCY95LEr1AbqW+befKIZT0hCcu2CbLv7IDLvXj+8cekdX96/2So674jhOvaFQcePcG
         IrC0Kem+T90HL+NTWiTQRYD6hlqERtpwu9hIQWKmirPKoOSmsJXYgqOgnfA7hyyOIBQ8
         hZgfgbEi/+PJ87FOf0UKMlW/zptJRQe0PFAb1flIQ4jrAwm3CTSkSvfn/jmTOkkz9MnK
         mglEMH4HT9vO8u1Rd2QR5vYJGeKheh6TPCm3md7H1OeRScLNGsYOoL/cWIPymGlzxTyV
         qZlA==
X-Gm-Message-State: AO0yUKXIZ7mH7Xb009rm1qFoyNvtb1QM3d7mnQrJ72Xpu4ARJbO3fABW
        SQAyCkv8nbsjokD/1SuPiOw=
X-Google-Smtp-Source: AK7set9PHZ8LXt7ZKyGjgbLsdHebLkM1r7cEjNaDm/+Rjg9817vE8fX7xo3XvrpgAIueHVVqN22SUg==
X-Received: by 2002:adf:f1ca:0:b0:2bf:d3dd:6f68 with SMTP id z10-20020adff1ca000000b002bfd3dd6f68mr1815493wro.7.1674823314815;
        Fri, 27 Jan 2023 04:41:54 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l7-20020adffe87000000b002bfbe30e8f8sm3826773wrr.98.2023.01.27.04.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 04:41:54 -0800 (PST)
Date:   Fri, 27 Jan 2023 15:41:31 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: Can smatch handle this better? (was: [PATCH 15/17] media: i2c:
 adp1653: introduce 'no_child' label)
Message-ID: <Y9PGezJ9ww20xCup@kadam>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
 <20230126150657.367921-16-hverkuil-cisco@xs4all.nl>
 <Y9KaFkDXIWjiKPzc@kekkonen.localdomain>
 <7bd53f49-c7ae-db42-35a7-51d7b27d079c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bd53f49-c7ae-db42-35a7-51d7b27d079c@xs4all.nl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 27, 2023 at 08:43:51AM +0100, Hans Verkuil wrote:
> Hi Dan,
> 
> While trying to clean up smatch warnings in the media subsystem I came
> across a number of 'warn: missing unwind goto?' warnings that all had
> the same root cause as illustrated by this patch: the 'unwind' path
> just has a variation on printk(), it is not actually cleaning up anything.
> 
> As Sakari suggested, is this something that smatch can be improved for?
> These false positives are a bit annoying.
> 
> You can see the whole series here if you are interested:
> 
> https://patchwork.linuxtv.org/project/linux-media/list/?series=9747
> 
> Regards,
> 

Oh wow.  I really hate do nothing gotos.  The canonical bug for do
nothing gotos is forgetting to set the error code.

I like that check because it finds a lot of error handling bugs.

It's not just about the printk().  I could and probably should make the
check ignore printks.  There is also an of_node_put(child);

The check doesn't look at what the error handling does, only that there
is a direct returns surrounded by gotos.

I could make the check so that it's only enabled when --spammy is turned
on.

I guess another option would be to only enable the warning if there were
more than one label in the cleanup section at the end of the function.
I can make that a warning and if there is only one label, then make that
disable unless --spammy is used.

regards,
dan carpenter

