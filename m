Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27613112B37
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 13:19:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfLDMTL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 07:19:11 -0500
Received: from mail.sig21.net ([80.244.240.74]:50927 "EHLO mail.sig21.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727445AbfLDMTL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Dec 2019 07:19:11 -0500
Received: from localhorst ([127.0.0.1])
         by mail.sig21.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
         (Exim 4.84_2)
        (envelope-from <js@sig21.net>)
         id 1icTcZ-0000KF-C9 ; Wed, 04 Dec 2019 13:19:09 +0100
Received: from js by zzz.local with local (Exim 4.93-RC5)
        (envelope-from <js@sig21.net>)
        id 1icTcY-0005mE-Mv; Wed, 04 Dec 2019 13:19:06 +0100
Date:   Wed, 4 Dec 2019 13:19:06 +0100
From:   Johannes Stezenbach <js@linuxtv.org>
To:     Vincent McIntyre <vincent.mcintyre@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>
Subject: Re: patchowork parsing issue?
Message-ID: <20191204121906.GA21908@linuxtv.org>
References: <CAEsFdVOUq4gyue+EZjbE_J_D=W=XnsJBTYGwfk9rV50DJmY+3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEsFdVOUq4gyue+EZjbE_J_D=W=XnsJBTYGwfk9rV50DJmY+3Q@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-21-Score: -2.7 (--)
X-Spam-21-Report: No, score=-2.7 required=8.0 tests=ALL_TRUSTED=-1,BAYES_00=-1.9,HEADER_FROM_DIFFERENT_DOMAINS=0.249 autolearn=ham autolearn_force=no
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 04, 2019 at 08:40:59PM +1100, Vincent McIntyre wrote:
> 
>   https://patchwork.linuxtv.org/patch/60186/
>   https://patchwork.linuxtv.org/patch/59979/
> 
> but it doesn't look right when it gets there. For some reason,
> the last hunk of the patch is included with the patch description.
> This was why I resent it the first time, I thought I must have
> messed up the formatting.
> 
> Admittedly I'm sending from gmail's web interface but I have taken
> some care to get the text correctly formatted and patchwork did the
> same thing with it twice, so I'm starting to wonder if there's an issue
> with patchwork.
...
> @@ -539,7 +546,7 @@ build - Builds the media drivers without needing
> to compile a new kernel

This line seems to be wrapped.

Quoting
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/email-clients.rst

  Gmail (Web GUI)
  ***************
  
  Does not work for sending patches.
  
  Gmail web client converts tabs to spaces automatically.
  
  At the same time it wraps lines every 78 chars with CRLF style line breaks
  although tab2space problem can be solved with external editor.
  
  Another problem is that Gmail will base64-encode any message that has a
  non-ASCII character. That includes things like European names.


HTH,
Johannes
