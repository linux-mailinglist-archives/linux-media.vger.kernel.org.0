Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3B8C40F5
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 21:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbfJATVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 15:21:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:48988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbfJATVb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Oct 2019 15:21:31 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B8A22133F;
        Tue,  1 Oct 2019 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569957691;
        bh=RvPcjkqM5b2a6CVQHXIlLz6KOitP1BK/6MO4s0dLGZc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pg56kXFZDvZ2UFF8/Q9cdu6eaCwbhHHF0vmLonJpPSelP68EsueUz4iYSsHv+SD1B
         4VGBw/C6FC6ysVLUxLEhfuDea8WRbZjfBv662puEHUg439Ev0NMW2kxuxBVKXu/7aC
         /hjecLhVJty2Gk3wF9fglDAKXR/7JjYQxJJ33Jvo=
Date:   Tue, 1 Oct 2019 21:21:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: PureThermal2 UVC video camera: Failed to submit URB 0 (-28)
Message-ID: <20191001192128.GA3962873@kroah.com>
References: <CAJ+vNU1UX-aaPVAnESgzyOx7chBFHPSDun0_4=Do4tjXZabhMg@mail.gmail.com>
 <CAJ+vNU1UdhbPSMZBOeW3XXBkALdNP8_Rk8T=bzeR9KpdqKC8VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ+vNU1UdhbPSMZBOeW3XXBkALdNP8_Rk8T=bzeR9KpdqKC8VQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 01, 2019 at 11:58:26AM -0700, Tim Harvey wrote:
> CONFIDENTIALITY NOTICE: This email constitutes an electronic 
> communication within the meaning of the Electronic Communications Privacy 
> Act, 18 U.S.C. 2510, and its disclosure is strictly limited to the named 
> recipient(s) intended by the sender of this message. This email, and any 
> attachments, may contain confidential and/or proprietary information. If 
> you are not a named recipient, any copying, using, disclosing or 
> distributing to others the information in this email and attachments is 
> STRICTLY PROHIBITED. If you have received this email in error, please 
> notify the sender immediately and permanently delete the email, any 
> attachments, and all copies thereof from any drives or storage media and 
> destroy any printouts or hard copies of the email and attachments.

Now destroyed.  Footers like this are one way to not get a response on a
public mailing list :(
