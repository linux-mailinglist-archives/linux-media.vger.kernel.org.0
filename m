Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A389052809C
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 11:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiEPJPi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 05:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbiEPJPh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 05:15:37 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F3E24946
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 02:15:35 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-2fee9fe48c2so23820297b3.3
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=buGMerFrqipK8Jb3tFvhac/c2c+O8piHg+izAwGyraI=;
        b=TRSFu7AbWsVW/Ef8XKz5pVDm+GvFxxetzEadtSFQsRoRxdZGatUSxQcN0RbdrR/c3C
         2FjzIubT3Y2DIAPnBoUvPxnorPnzLnh5vHcaYzKFI/BaViRO9wGm2N1DGT82wQuc+qq8
         ibBiJXUL8NyNGdg/583OfNipR1kw3/PpbUuk7WMcxkMiFSFd92XCA+xDvaMLrS1qvv2J
         7vSfn9Gx3h7n5EhrBeuf4E7srBVY6dux5fUQUP/lT0YaeWUp7M0MMG2xkEvMjVz4zN0O
         vl5DnOW8QaoTM+tjjuSsyxMr1RhEH0TDVWRuXFCWw3WLEDLBpvecJwXSAASiLwkAFI+r
         YLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=buGMerFrqipK8Jb3tFvhac/c2c+O8piHg+izAwGyraI=;
        b=IGcSM5sZF8stSgY/eotxZI8p8r/bwrxXqzv9gNr7Pl8Iop9B3EA8EZOKMyEx0+c1oP
         6BxddGm/kWcM586e1x60ycj6yJ1+fFooGz4BLShyehZMa8Ai0hltEECJb8IgZTbAKfLR
         YT4/cUF1SoUcHBkqRMsDG0A8ZsxALxqzHURlcmEPORX2dDeNuLuEwb8gE7u7+/1bC21/
         rAJOqlvLt9hAbCicAGdONrpcOgr0YWhMTJEWjjGAkzmNSoUsKAtYallDW9jUiWIzEHZ+
         EhlzbNU6GuNd66mfVHW1OFusM98CysDr1m13JO8mOHux2Ld8vm0L0ernYzjSneFBaZpy
         7b2w==
X-Gm-Message-State: AOAM530YliA6l0PPlLq7bHX7Lv3U4QMxz8xmzbw6kqdPNwgdOdpZ/jdo
        AfDs2vwl9Spqy5rTHf0UKi0lLgcgMSKCTaNq9qmtoQ==
X-Google-Smtp-Source: ABdhPJwFI6dvAkIgwWlRuN3bI3SCin//obBcEH44i2JoBsm8GZkg6NmkNqIVdwGF1AKvXK3+QEMyX7qaM7sPUGL8JHk=
X-Received: by 2002:a0d:e657:0:b0:2fe:eed7:61e9 with SMTP id
 p84-20020a0de657000000b002feeed761e9mr5350115ywe.417.1652692534237; Mon, 16
 May 2022 02:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220308033839.3773-1-arec.kao@intel.com> <20220308033839.3773-2-arec.kao@intel.com>
 <YidQtF28hqh6Ew7j@paasikivi.fi.intel.com>
In-Reply-To: <YidQtF28hqh6Ew7j@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@google.com>
Date:   Mon, 16 May 2022 18:15:23 +0900
Message-ID: <CAAFQd5DNY0bW4crJtLjKDAVLnypePE5OH2xoQwc_oXy7-9_-=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] Re-run BLC when gain change
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Arec Kao <arec.kao@intel.com>, linux-media@vger.kernel.org,
        andy.yeh@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 8, 2022 at 9:48 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Arec,
>
> Thanks for the patch.
>
> On Tue, Mar 08, 2022 at 11:38:39AM +0800, Arec Kao wrote:
> > Changing the gain affects the black-level through the device;
> > the gain should therefore not be changed during a BLC procedure.
> > If the gain changes, then the BLC routine should be re-run
> > in some scenarios.
>
> Could you also explain what are the scenarios the BLC routine should be
> re-run and how does the user space know this should be done? Could this be
> done in the driver instead without involving the user space?

FWIW, this turned out to be a camera module design issue (the
investigation was running in parallel to the potential software fix),
so this patch series isn't needed anymore.

Best regards,
Tomasz
