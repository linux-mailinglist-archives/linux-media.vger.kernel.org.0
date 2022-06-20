Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7896055102C
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 08:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236455AbiFTGSm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 02:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233453AbiFTGSj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 02:18:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8822BE35
        for <linux-media@vger.kernel.org>; Sun, 19 Jun 2022 23:18:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5C792B80E5B
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 06:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2369C3411B;
        Mon, 20 Jun 2022 06:18:34 +0000 (UTC)
Message-ID: <5db777a7-be69-09d7-2a0e-1a288aaf33f4@xs4all.nl>
Date:   Mon, 20 Jun 2022 08:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: A question about cec-ctl use? How to sent raw CEC codes?
Content-Language: en-US
To:     "Jibun no Kage ." <jibunnokage@gmail.com>,
        linux-media@vger.kernel.org
References: <26afef02-e088-d787-31a9-d772e82e8869@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <26afef02-e088-d787-31a9-d772e82e8869@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/19/22 23:11, Jibun no Kage . wrote:
> A question about cec-ctl use?  How to sent raw CEC codes?  I want to send via cec-ctl switching from HDMI1 to HDMI2, using cec-client I would just transmit a raw control code, for example...
> 
> For my TV...
> 
> Select HDMI 1...
> 
> /bin/echo 'tx 4F:82:10:00' | /usr/bin/cec-client -s -d 1
> 
> Select HDMI 2...
> 
> /bin/echo 'tx 4F:82:20:00' | /usr/bin/cec-client -s -d 1
> 
> So now I am trying to convert from cec-utils/cec-client to cec-ctl use.  How do I mirror the above functionality?  Can cec-ctl be used to send raw CEC commands?  Or some other way to achieve the same result?
> 
> Thanks,
> 
> -JnK
> 

cec-ctl -d /dev/cecX --active-source phys-addr=1.0.0.0

See also: cec-ctl --help-one-touch-play

Since cec-ctl supports all known CEC commands, you generally do not use
raw CEC codes. You can with --custom-command, but that's almost never used.

Regards.

	Hans
