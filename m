Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 352455B0116
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 11:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbiIGJ7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 05:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiIGJ6v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 05:58:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F85B72B9
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 02:58:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7DFDEB81C08
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 09:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882F1C433D6;
        Wed,  7 Sep 2022 09:58:31 +0000 (UTC)
Message-ID: <34f930db-db94-b134-4a1d-b9586e5b54be@xs4all.nl>
Date:   Wed, 7 Sep 2022 11:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V2
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
 <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
 <b76bd2fb-d0bc-2e71-26ec-b98b9949700d@xs4all.nl>
 <YxhplLKtRAQzlSK/@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <YxhplLKtRAQzlSK/@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-10.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/09/2022 11:51, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Wed, Sep 07, 2022 at 08:51:48AM +0200, Hans Verkuil wrote:
>> On 05/09/2022 16:44, Laurent Pinchart wrote:
>>> On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
>>>> On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
>>>>> 16:45-18:00 Anything else?
>>>>
>>>> I think it'd be great to have a GPG key signing party at the end of the
>>>> meeting.
>>>
>>> It's a good idea. Could everybody please send their GPG key fingerprint
>>> in an e-mail reply to prepare for that ? It can easily be retrieved with
>>> 'gpg -K' (make sure to pick the right key if you have multiple of them).
>>> I'll start:
>>>
>>> sec   rsa4096/0xF045C2B96991256E 2014-10-09 [C]
>>>       94231B980100EC619AC10E10F045C2B96991256E
>>> uid                   [ultimate] Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>> If you're generating a key for the occasion, create a primary key with
>>> the Certify (C) capability only, and create separate sub-keys for
>>> Signature (S) and Encryption (E). There's little reason these days to
>>> use less than 4096 bits for the primary key if you opt for RSA. The
>>> subkeys should have an expiration date.
>>>
>>> The primary key can then be moved to safe storage, you will only need
>>> the subkeys for daily usage.  The primary key will be used only to
>>> create new subkeys and to sign other people's keys.
>>>
>>
>> Can you also give instructions on what to do at the key signing party?
>>
>> I do this so rarely that I always forget what magic gpg commands I need
>> to make to sign keys.
>>
>> If everyone has this information at hand, then we can quickly proceed with
>> this on Monday.
> 
> Good point.
> 
> First of all, everybody should make sure that their key is published on
> key servers.

Which key servers? That's never been clear to me: which key server(s) are
you supposed to use?

Regards,

	Hans

> 
> I will gather al the keys and print a list that I will hand out to
> everybody on Monday. This will be the authoritative source of
> information, as anything stored in digital form could theoritically be
> tampered with.
> 
> We will go around the table, and everybody will check that their key ID
> matches the printed documented (to make sure I haven't tampered with the
> printed version they have received), and read it out loud for everybody
> to compare with their own printed version (to make sure I've distributed
> the same version to everybody). If any mismatch is noticed, people are
> expected to shout out loud.
> 
> Then we will verify identities. If we have a laptop with a webcam that
> can be hooked up to a projector, we can simply take turns and show a
> government-issues ID that clearly displays our name, for people in the
> room to compare that with the keys. Once the fingerprints and the
> identities are checked, the corresponding keys should be marked as
> verified on the paper version.
> 
> The next step is to sign keys. This is something that will happen after
> the media summit, and if you have your master key on offline storage,
> will happen after you get back home. You will need to download keys from
> key servers, verify that the fingerprints match the paper version and
> sign the keys.
> 
> The final step is to publish signatures. I'll try to check what the
> latest best practices are. One option is to simply publish the
> signatures to key servers, but we can also mail them to the key owner,
> in an encrypted e-mail to make sure the recipient is the intended
> person.
> 

