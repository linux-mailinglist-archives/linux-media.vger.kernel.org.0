Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD9D4D5BA3
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 07:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243000AbiCKGdm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 01:33:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiCKGdk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 01:33:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D93130F7A
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 22:32:37 -0800 (PST)
Received: from [IPV6:2a01:e0a:169:7140:7789:aeb5:30a2:dae1] (unknown [IPv6:2a01:e0a:169:7140:7789:aeb5:30a2:dae1])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F284D488;
        Fri, 11 Mar 2022 07:32:35 +0100 (CET)
Message-ID: <f7363bc8-97c3-81d1-d554-d7220c71a9fc@gmail.com>
Date:   Fri, 11 Mar 2022 07:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Philips SPC 530NC
Content-Language: en-US
To:     Francisco Levrino <franciscolevrino@gmail.com>,
        linux-media@vger.kernel.org
References: <37e49153-61ec-6361-d739-fbce79a7c3a6@gmail.com>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@gmail.com>
In-Reply-To: <37e49153-61ec-6361-d739-fbce79a7c3a6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NICE_REPLY_A,NML_ADSP_CUSTOM_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Francisco,

On 11/03/2022 03:36, Francisco Levrino wrote:
> hi, i've tried the driver for the web cam and for the video it works 
> perfectly but the audio does not. is there any way you can add that 
> feature? thanks
> 

If the audio is not working, then you should probably ask your question 
on the alsa-devel list.

Having replies might need a bit more details on your side though :-):
- Are you running on mainline ?
- Can you dump lsusb -v to know which driver is involved
   it is probably gspca, based on 
Documentation/admin-guide/media/gspca-cardlist.rst
- Can you dump dmesg at least, to see if anything related to the audio 
driver may come up ?

These are really insights, I can't tell it will work, and maybe is it 
useless, but saying "it does not work" may not be enough ;-).

BR,
JM
