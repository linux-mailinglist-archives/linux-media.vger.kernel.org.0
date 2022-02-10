Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C75C24B0D38
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 13:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235970AbiBJMKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 07:10:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232947AbiBJMKV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 07:10:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D6D1098
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 04:10:22 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A037393;
        Thu, 10 Feb 2022 13:10:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644495020;
        bh=V4EgKr8YwLSqUCq4o3LNfy3Y9fgkyQHTHCXC+GDKqfA=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=sFUspVgHhQecA8jLCLBnYTf3bHjfZMHT3WvFXO18/uS8fWw/+QlAHlP5QF0QsOeeP
         p5WZXtWdfFSuxffDMZIQSLnzaX7V1IWPWTk6NLD2vDev4b1iwY3x66fN+obcYULX0E
         oNZbLwB+C3zDILvoHDQrJ+F2QXgxt7nbYQObeyNM=
Message-ID: <138372b5-5889-f311-491d-905e03374479@ideasonboard.com>
Date:   Thu, 10 Feb 2022 14:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/23] media: ov5640: Rework the clock tree programming
 for MIPI
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <e806f43b-d313-7652-39e4-4b4bade29cda@ideasonboard.com>
In-Reply-To: <e806f43b-d313-7652-39e4-4b4bade29cda@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/02/2022 14:03, Tomi Valkeinen wrote:
> Hi,
> 
> On 10/02/2022 13:04, Jacopo Mondi wrote:
>> v1:
>> https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
>>
>> A branch for testing based on the most recent media-master is 
>> available at
>> https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v2
>>
>> If anyone with a DVP setup could verify I have not broken their use case
>> I would very much appreciate that :)
> 
> What is this based on? I'm not able to apply. "error: sha1 information 
> is lacking or useless"

Answering to myself: The branch url above had an extra #, so my git 
fetch didn't get the right branch. And in that branch there's an extra 
commit that this series was based on.

  Tomi
