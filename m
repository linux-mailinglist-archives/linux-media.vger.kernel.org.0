Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F29D200B12
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 16:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgFSONO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 10:13:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59474 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgFSONO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 10:13:14 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D536C2A3738
Message-ID: <f2bf8846e265024c20a77fa618d54455b3b7ca95.camel@collabora.com>
Subject: Re: [PATCH v1 1/1] Add support for meson building
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     kieran.bingham@ideasonboard.com,
        Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, nicolas@ndufresne.ca,
        gjasny@googlemail.com,
        nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Xavier Claessens <xavier.claessens@collabora.com>
Date:   Fri, 19 Jun 2020 11:12:58 -0300
In-Reply-To: <d09caaf6-402f-ba57-825c-410ce39a5e2b@ideasonboard.com>
References: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
         <20200618133303.28676-2-ariel@vanguardiasur.com.ar>
         <d09caaf6-402f-ba57-825c-410ce39a5e2b@ideasonboard.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Xavier, Nicolas

On Thu, 2020-06-18 at 14:57 +0100, Kieran Bingham wrote:
> Hi Ariel,
> 
> Wow there's a lot of work there! That must have taken quite some effort
> between you and Ezequiel!
> 

(: I don't remember having done much, so all kudos must go to Ariel.
 
> I've looked through, and about the only thing that stands out to me is
> the way you're joining strings.
> 
> Meson provides a join_paths() function specifically for that.
> Now we're "probably" not going to build this library on anything other
> than linux, but I think the function still has merit over the arbitrary
> strings which I mis-interpreted for 'divide' at first glance :S
> 
> Other than that, I expect we will have to run both build systems in
> parallel for some time to allow packaging and other builders to adapt.
> That might mean it's a bit more difficult to make sure both build
> systems are updated when adding new files or changing the build in anyway.
> 

Why?

Is it too naive to expect that's it's safe to just turn the flip on meson,
and remove autotools?

Everyone doing packaging is already aware and used to meson.

Thanks!
Ezequiel


