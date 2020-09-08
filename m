Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8AC1260D29
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 10:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgIHINc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 04:13:32 -0400
Received: from fgw23-4.mail.saunalahti.fi ([62.142.5.110]:52514 "EHLO
        fgw23-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729624AbgIHINa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 04:13:30 -0400
Received: from sinitiainen (85-156-156-197.elisa-laajakaista.fi [85.156.156.197])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 29eea3c5-f1ab-11ea-8ccc-005056bdfda7;
        Tue, 08 Sep 2020 11:13:23 +0300 (EEST)
Received: from kuusitiainen.riihineva.no-ip.org ([192.168.1.40])
        by sinitiainen with esmtp (Exim 4.71)
        (envelope-from <timo@riihineva.no-ip.org>)
        id 1kFYkl-00030W-57; Tue, 08 Sep 2020 11:13:23 +0300
Subject: Re: Asus PN50 CEC
To:     linux-media@vger.kernel.org
References: <e56fb2cd-5e40-b83e-f702-0dced9df86fb@riihineva.no-ip.org>
 <8634e5af-175d-1fff-1693-1445f336b9f9@xs4all.nl>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>
From:   Timo Ketola <timo@riihineva.no-ip.org>
Message-ID: <d2d11658-7e06-986f-36dd-1321abc2baee@riihineva.no-ip.org>
Date:   Tue, 8 Sep 2020 11:13:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8634e5af-175d-1fff-1693-1445f336b9f9@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8.9.2020 10.57, Hans Verkuil wrote:
> I suspect that this is a BIOS-only implementation that just does the bare minimum
> for wake up and standby (if enabled).

What does it mean? Is it just that BIOS does not report about it to the 
OS? If it was implemented with GPIOs, shouldn't it still be possible to 
write a driver for it - in theory - if we somehow were able to find out 
the GPIOs?

Unfortunately, I don't know too much about modern PCs at this level.

Thanks for looking at this!

--

Timo
