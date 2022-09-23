Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D63E5E7668
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 11:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbiIWJFt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 05:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbiIWJFr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 05:05:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB403D62C5
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 02:05:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A8A03B82022
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 09:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D59C433D6;
        Fri, 23 Sep 2022 09:05:42 +0000 (UTC)
Message-ID: <5fed4416-bdc6-dc85-f212-0154ad5c9036@xs4all.nl>
Date:   Fri, 23 Sep 2022 11:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Issue with Marshall Camera on Debian 11 - request for help
Content-Language: en-US
To:     "Rouchet, David" <david.rouchet@barco.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <DU0PR09MB590505740FD1B5B1C21D7425EA4E9@DU0PR09MB5905.eurprd09.prod.outlook.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <DU0PR09MB590505740FD1B5B1C21D7425EA4E9@DU0PR09MB5905.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

linux-media is the correct mailinglist, but your email has to use plain ASCII, not HTML.

HTML emails are silently rejected by that mailinglist, which is why it didn't appear there.

All the right people read linux-media, so that's your best bet.

Regards,

	Hans

On 22/09/2022 15:50, Rouchet, David wrote:
> Hi,
> 
> We are having issues with a camera, namely Marshall CV605-U3, where the camera stopped working when we updated from Debian 10 to Debian 11. Either the stream doesn't show up or with a very slow framerate.
> 
> The only way to get it working is with using a script that reload the driver twice. We have contacted the manufacturer, but have not gotten the confidence they will be able to identify the issue, as it may be related to the uvc driver and/or USB 3.0.
> 
> The solution we are developing is making use of various cameras, as well as other A/V devices on the market, and so far this one is the only one that doesn't work.
> 
> Long story short, we'd like to see if we can have the help of a specialist (the driver writer(s) for example) on UVC driver for Debian 11. This help could have different forms, up to purchasing consulting time if required.
> 
> Let me know if there is a possible way forward.
> 
> Best Regards
> 
> David Rouchet
> Head of weConnect R&D Program
> E mailto:david.rouchet@barco.com
> 
> This message is subject to the following terms and conditions: MAIL DISCLAIMER<https://www.barco.com/en/maildisclaimer>

