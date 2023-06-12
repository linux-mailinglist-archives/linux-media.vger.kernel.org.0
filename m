Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61C0972C31D
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 13:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbjFLLjM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 07:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbjFLLiV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 07:38:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D4B7EF5
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 04:30:06 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E073C4C;
        Mon, 12 Jun 2023 13:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686569375;
        bh=pgASBEXC4d0ScMHcPi2gNqgbyRu2iFJMQV4244XS+Dc=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=tiXwHwjuoIg9WoCyB4DpYmaLJjxYaO7X1EK8GqDSmDSUnXazrfUfYe5bd4Iatwnvr
         RJIjGZuucCvXHFDogRVFdhBYUG8Lqfl4cFFW2X8l9VegLzvxx194P6Wb58G5l/OuTj
         lxXYyD0qh/WQ98sOOjNXSl0QMTJUj63MlWYsWUMQ=
Message-ID: <02aed2c7-6c69-852d-7c72-ce781f0b2aca@ideasonboard.com>
Date:   Mon, 12 Jun 2023 12:30:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-2-hdegoede@redhat.com>
 <8575dadf-7db6-5c97-7fbb-1822c1fab0ee@ideasonboard.com>
 <c7d90ea3-6a87-4dba-5c53-d62d95a3bef9@redhat.com>
 <0e24ca78-31bf-a394-2134-3fcca1f5d379@ideasonboard.com>
 <CAHp75Vdaj4ynLvJLBONPLjGeBHMV4fxBD_-XExT6vxknp-_5Rg@mail.gmail.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 01/28] media: ov2680: Remove auto-gain and auto-exposure
 controls
In-Reply-To: <CAHp75Vdaj4ynLvJLBONPLjGeBHMV4fxBD_-XExT6vxknp-_5Rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 12/06/2023 10:57, Andy Shevchenko wrote:
> On Mon, Jun 12, 2023 at 10:59 AM Dan Scally <dan.scally@ideasonboard.com> wrote:
>> On 12/06/2023 08:44, Hans de Goede wrote:
> ...
>
>> Ah yeah I see it now. Looks good to me then: Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Do not forget to put tags on a separate line, so tools, such as b4,
> may pick them up.


Ah - my bad, I'll do that in future.

>
>
>
