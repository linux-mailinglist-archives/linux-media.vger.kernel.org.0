Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D41D201AE1
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 21:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgFSTFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 15:05:10 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33636 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbgFSTFI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 15:05:08 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: xclaesse)
        with ESMTPSA id 2D15D2A0C0C
Message-ID: <ea49c99ceeba47cee958fed6b04773963757d49d.camel@collabora.com>
Subject: Re: [PATCH v1 1/1] Add support for meson building
From:   Xavier Claessens <xavier.claessens@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        kieran.bingham@ideasonboard.com,
        Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, nicolas@ndufresne.ca,
        gjasny@googlemail.com,
        nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Fri, 19 Jun 2020 15:04:57 -0400
In-Reply-To: <f2bf8846e265024c20a77fa618d54455b3b7ca95.camel@collabora.com>
References: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
         <20200618133303.28676-2-ariel@vanguardiasur.com.ar>
         <d09caaf6-402f-ba57-825c-410ce39a5e2b@ideasonboard.com>
         <f2bf8846e265024c20a77fa618d54455b3b7ca95.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 19 juin 2020 à 11:12 -0300, Ezequiel Garcia a écrit :
> I've looked through, and about the only thing that stands out to me
> > is
> > the way you're joining strings.
> > 
> > Meson provides a join_paths() function specifically for that.
> > Now we're "probably" not going to build this library on anything
> > other
> > than linux, but I think the function still has merit over the
> > arbitrary
> > strings which I mis-interpreted for 'divide' at first glance :S
> > 

Note that you can also use 'some' / 'path' instead of
join_paths('some', 'path'). AFAIK '/' works fine in Windows paths too.

