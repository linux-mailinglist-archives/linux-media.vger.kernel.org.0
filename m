Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 421441ED2E4
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 17:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgFCPCM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 11:02:12 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:56762 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725985AbgFCPCL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 11:02:11 -0400
X-Greylist: delayed 1529 seconds by postgrey-1.27 at vger.kernel.org; Wed, 03 Jun 2020 11:02:10 EDT
Received: from MUA
        by vps-vb.mhejs.net with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.93.0.4)
        (envelope-from <mail@maciej.szmigiero.name>)
        id 1jgUVT-0008RG-22; Wed, 03 Jun 2020 16:36:39 +0200
Subject: Re: [PATCH v12 0/8] [media] Add analog mode support for Medion
 MD95700
To:     Lukas Straub <lukasstraub2@web.de>
Cc:     Michael Krufky <mkrufky@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Walls <awalls@md.metrocast.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
References: <cover.1556554056.git.mail@maciej.szmigiero.name>
 <20200603163326.2550376b@luklap>
From:   "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Autocrypt: addr=mail@maciej.szmigiero.name; prefer-encrypt=mutual; keydata=
 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 sg==
Message-ID: <4e45c57c-5774-5e00-4122-d74f4635444f@maciej.szmigiero.name>
Date:   Wed, 3 Jun 2020 16:36:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603163326.2550376b@luklap>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03.06.2020 16:33, Lukas Straub wrote:
> On Mon, 29 Apr 2019 18:16:51 +0200
> "Maciej S. Szmigiero" <mail@maciej.szmigiero.name> wrote:
> 
>> This series adds support for analog part of Medion 95700 in the cxusb
>> driver.
>>
(..)
> Hi,
> Any status on this?

It has been merged already a year ago.

> Regards,
> Lukas Straub
> 

Maciej
