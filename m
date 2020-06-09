Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90881F3F03
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 17:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730715AbgFIPPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 11:15:55 -0400
Received: from jpvw.nl ([80.127.100.2]:36064 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730436AbgFIPPz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Jun 2020 11:15:55 -0400
Received: from [127.0.0.1] (helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.93)
        (envelope-from <jp@jpvw.nl>)
        id 1jifyh-000RBu-MU; Tue, 09 Jun 2020 17:15:51 +0200
Subject: Re: Scanning for TV channels over DVB-T and DVB-T2
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        linux-media <linux-media@vger.kernel.org>
References: <11fbc112-c410-8c67-9bcb-9450924d12ef@free.fr>
From:   JP <jp@jpvw.nl>
Message-ID: <3d62014d-4a02-6631-6989-37f67118f7ea@jpvw.nl>
Date:   Tue, 9 Jun 2020 17:15:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <11fbc112-c410-8c67-9bcb-9450924d12ef@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/8/20 5:30 PM, Marc Gonzalez wrote:
> Hello,
>
> Suppose we know that several channels are transmitted on a given frequency
> by terrestrial antenna. However, we don't know if the signal is "encoded"
> (not sure this is the right term) in DVB-T or DVB-T2 modulation.
>
> Do we have to scan the frequency /twice/
> first with DTV_DELIVERY_SYSTEM = SYS_DVBT
>   then with DTV_DELIVERY_SYSTEM = SYS_DVBT2 ?
>
> Or is there some optimization where both modulations are handled
> in a single step?
>
> Or maybe it depends on the tuner driver?
It depends on the scan tool. Last time I used one te create my
channel list I had to give a parameters to the command
to skip encoded channels. That was over a year ago; I don't
remeber any specifics.

Jan Pieter.

> Regards.

