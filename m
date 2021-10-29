Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD0143FECD
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 16:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhJ2O73 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 10:59:29 -0400
Received: from mout02.posteo.de ([185.67.36.66]:60589 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229621AbhJ2O73 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 10:59:29 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 93238240107
        for <linux-media@vger.kernel.org>; Fri, 29 Oct 2021 16:56:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1635519418; bh=60uRJ5P8VAuV2COTCCdUL25p4uA0Ef5kVokiGYKd1Kk=;
        h=Date:From:To:Subject:From;
        b=KVdU7p64nQRU1BIVKb0BYX1ORDzEO68yYFn21L3KLUFhTXe+YXAHGIMTPOz5+KIt5
         kt5er+eZwaUFFaEaIXYZdq060Cs9uxVOtrwk818BEvciHuXaU0OiFoGUhiOKlOQXEh
         duCPcvvZU7YVHZekrUSSqrJ94yqpDNsyVL45G9niQXEOe6XomlYcQqsXbuK0dPfHzP
         TTjkqoGtV9CvaCA1JIv+3+/C3b9rcQjcet336h3ZyB4Ny9pYeBrtW1pgS8WTPjb4MP
         Vn0MCgvUWSFHAYmF9o7QqVYbcvOzOaTxG2B5LV12JiDBgzTMOWQ+hMIpkEBHQqQ+K8
         39R4GohqX5k4g==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4HglrV0fGkz9rxB
        for <linux-media@vger.kernel.org>; Fri, 29 Oct 2021 16:56:57 +0200 (CEST)
Date:   Fri, 29 Oct 2021 14:56:57 +0000
From:   Patrick Boettcher <patrick.boettcher@posteo.de>
To:     linux-media@vger.kernel.org
Subject: Re: Kernel 5.10 - imx-media does not create /dev/media0
Message-ID: <20211029165657.5f520399@yaise-pc1>
In-Reply-To: <20211028085847.34ebce79@yaise-pc1>
References: <20211028010412.49a3c812@yaise-pc1>
        <20211028085847.34ebce79@yaise-pc1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Thu, 28 Oct 2021 06:58:47 +0000
Patrick Boettcher <patrick.boettcher@posteo.de> wrote:

>On Wed, 27 Oct 2021 23:04:12 +0000
>Patrick Boettcher <patrick.boettcher@posteo.de> wrote:
>
>Maybe it'll help to spot the problem immediately.


I was missing CONFIG_MUX_MMIO. Strange that it's not activated by
default.

Should it?

--
Patrick.

