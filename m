Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA1836E5CA9
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 10:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbjDRI4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 04:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjDRI4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 04:56:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D971AD
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 01:56:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3EBC462ED1
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 08:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230FCC433D2;
        Tue, 18 Apr 2023 08:56:47 +0000 (UTC)
Message-ID: <391fab6c-c247-0661-0389-8ea395ce5957@xs4all.nl>
Date:   Tue, 18 Apr 2023 10:56:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: atomisp compiler/sparse/smatch warnings
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <93737d84-cfa0-ece5-4115-afa8ae74299c@xs4all.nl>
 <a71bc016-11e2-f9c8-f2b7-57b55a219360@redhat.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <a71bc016-11e2-f9c8-f2b7-57b55a219360@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/18/23 10:48, Hans de Goede wrote:
> Hi Hans,
> 
> On 4/18/23 09:29, Hans Verkuil wrote:
>> Hi Hans,
>>
>> Can you take a look at the warnings in the daily build that are atomisp
>> related?
>>
>> https://hverkuil.home.xs4all.nl/logs/Tuesday.log
> 
> I'm sick atm, I'll take a look later but it may
> be a while before I get around to this.

Beterschap!

I'll take a look at it today/tomorrow, so don't bother with this
and get better soon!

Regards,

	Hans
