Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB8D240675
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 15:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgHJNKv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 09:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgHJNKv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 09:10:51 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F20BC061756;
        Mon, 10 Aug 2020 06:10:51 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id n129so2535141qkd.6;
        Mon, 10 Aug 2020 06:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=ujiAdgT+/a8lkUEdLHIcLIc1M7AMlHOeXKUBIZSN4YU=;
        b=o6Whz9sEOU24iSepBzhEUAwpb1491mF7wazNBqguAhSXidNblShAUmjT0ULKRkdxcC
         CfNSPrBbSH3yqO8MRsc1x5hSqDvpzd3A29aprp9/xqFg9YlGt9VpOtl+h9PeF3oenLYN
         JbYAI73pZUcD2MK4TpsESV5uOE4QgE6o4HbijFIxnm68JtexOnRXvW2mLhB7X/R6tap+
         SaeML+LcJ30+yaUYveXBAMejOEvcrAebWZRGy1SN7IB1ZHJKUuDy/41ABAltlbkmXZL5
         rq+KHqqju8U63UEaXGVnV6HL1FTcwGck6WjCb8aD4Mfjoa5ZSToaMvhEanWoo6IHaGxM
         BCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=ujiAdgT+/a8lkUEdLHIcLIc1M7AMlHOeXKUBIZSN4YU=;
        b=kfrrG9HeA1/2aSKf7jOdsgFTUxn61yJL55RT/ODDVy/LqMrHBVpGERnLqloFuCwZud
         UhUJRyQwP4H99/QlQzvR4UNiOHxZMBXKriAcxDfYK8LX5EayF5kzLubkOTKgIkiWEgCV
         8C/8hOY3lc7xo1yRb+l/m555L9l4hCXveuDnnO2hYHvW2OQFk2IGP2JLT23tOsk76I0+
         UoNnQDy/PK9UN5nFl4XwXYomlAxXy7ovPyGIo4UVxdUFenxMbcrjwrq6w2DqRXThGerW
         V8Xa5ReAlxRYCSCP5FthLKTAchBA7EvjRJAn6ffreNEEJneYYvcZ0v0sbE02TsY4Kcz/
         Nx1Q==
X-Gm-Message-State: AOAM531/8dJrMT1kemlzvnL5oOBGsU3LNbqtbvnUfV7PMjRkwnV2Jb1U
        LKyoWbblcyNNFrdgNmSpkAE=
X-Google-Smtp-Source: ABdhPJyebrqHyf2sIFVLFzm8DaF3vOf/GUcosAoNFNy94psyps5t6cMgWC/xXwFlnC4NhKF8yG+KqQ==
X-Received: by 2002:a37:b787:: with SMTP id h129mr24913657qkf.402.1597065049358;
        Mon, 10 Aug 2020 06:10:49 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id l1sm15388418qtp.96.2020.08.10.06.10.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2020 06:10:48 -0700 (PDT)
Date:   Mon, 10 Aug 2020 10:10:45 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "=?utf-8?Q?linux-media=40vger.kernel.org?=" 
        <linux-media@vger.kernel.org>,
        "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" 
        <linux-kernel@vger.kernel.org>
Message-ID: <6FF983D6-F754-42CB-8745-EF1DFA76B12F@getmailspring.com>
In-Reply-To: <20200808204517.GJ6186@pendragon.ideasonboard.com>
References: <20200808204517.GJ6186@pendragon.ideasonboard.com>
Subject: Re: [PATCH 04/20] media: uvc: uvc_v4l2.c: add temp variable for
 list iteration
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, thanks for reviewing!

> If no entity is found by this loop the next line will dereference a NULL
> pointer. There's a similar issue below.

You mean this line, right?
>		pin = iterm->id;

In which case, yes I missed it!

> I think the issues reported by coccinelle are false positives, as every
> chain is guaranteed to have the proper input terminals (ITERM). This is
> verified when constructing the chain at probe time.

I thought so too, but I thought it would be nice to get rid of the
warning anyways. Probably other people will send patches for this same
issue in the future too, i.e. until this warning is not there anymore.

Do you have any suggestions or should we just leave this alone? :)

Maybe:

if (iterm)
  pin = iterm->id


This line will return an error if the iterm is not found anyway:

	if (iterm == NULL || iterm->id != pin)
		return -EINVAL


Let me know what you think

- Daniel
