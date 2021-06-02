Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6348C39910F
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 19:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbhFBRGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 13:06:08 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:37767 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229625AbhFBRGH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 13:06:07 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id oUHzlWRcIIpGyoUI2lQ4VZ; Wed, 02 Jun 2021 19:04:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622653463; bh=cWSeRZUWGBvdIB1xII9wWpJlbD3hbbRGtK7oE2FDWsw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Yi+bDPV1kCQGQ1PNWfu8oEujLpcVnk7TnONpNtYY4vMFSzXh6Q5QMVdpvvGFFbLyW
         Buca2xEEioVDxpfYZv15fL95uIFLWwNwCleZEqjID5EsobvZ2RNCg3lCgV/D/HUc2D
         eOYcXLNHWSE3YaAn6qbviWA+u54Y09QKKI0+SH4JqUtWulO6h6Ml8Pw03XHW0DlLKe
         EPj6gGVAYF2/vUmx708sJgozfYHKPMesqRPEFjcmkMU8M8L2UUv0xmIOK9DF+6vVl2
         ey5DuGzLOChZ3fj6Snt7qvG6qElUIwa6aQ2GbUrwCpKqIBK5C1yaY1ba7MYKle06lX
         GUzEtvkTFEcKA==
Subject: Re: [PATCH 6/9] media: platform: Add Synopsys DesignWare HDMI RX
 Controller Driver
To:     Nelson Costa <Nelson.Costa@synopsys.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
 <42b1ff078618a90973f25311eae725f0f151acc5.1622631488.git.nelson.costa@synopsys.com>
 <19a78e24-b767-e5bb-e932-e704fe8614be@xs4all.nl>
 <MW3PR12MB44591B23D792BF44BD666CAAC13D9@MW3PR12MB4459.namprd12.prod.outlook.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2a78fa1e-2243-1956-60ac-a2611e8bf8ad@xs4all.nl>
Date:   Wed, 2 Jun 2021 19:04:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <MW3PR12MB44591B23D792BF44BD666CAAC13D9@MW3PR12MB4459.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfG9oXeheh9RGtrB+v/ODDBPz7UPe5UqV+uM+UmGVVQrgoQ/CTSYdo2/K2C/EbHEkIIkN62Erl9xKy1ym0IsdHYBhyA1lyX0+5txXQ+20u8qHAGt24KeO
 PMeoP+iserDZDOiWXyOpOlyU4ztl39G0odJj9eUbx0XwZIReStwbWyVNC2MQqs64prhRQ8TOl1J4MAfkSUM6wScdm1ZS9YF5CNlbMoYkTM/EVJ+uBbIzGjrx
 1o7ycTLJZWp4/mjRvPdcCwZ6lxWRLby0AElg6AqkxfwGxouT3TD2k+BmSLwZUAdU7Q7LnwVP6Hmg0uFlubLYZQ1mort2hKj3RmVFIc+knS5cK4V/upO+FK7N
 uTr8u7taOQ4tKq0iC2TP9L0yCcCj6I2GhGKEIKDtY4KXtfhFnNrjB1LHKXtP5JCwvmUvuyrvSyg5smt7hDBShuYd6Yw+U0OHu47BNsLUAmeAwL40MYessDgs
 YIFX5iJXlyj/QjZrF6VNEdbrcOm9QJqn7NFMaseUkWAIBfEZQivPVVaF+qo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nelson,

On 02/06/2021 17:44, Nelson Costa wrote:
> Hi Hans,
> 
> Thanks for your initial comments and feedback!
> 
> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Date: qua, jun 02, 2021 at 12:54:38
> 
>> Hi Nelson,
>>
>> Thank you for this patch. Some initial comments below, I will
>> need to go over this another time for some of the colorimetry
>> related functions.
>>
> 
> Ok.
> 
>> BTW, if you are interested in HDCP support, let me know. Cisco worked
>> on an API for this, but due to various reasons we have not been able
>> to upstream it. But we do use it in our products.
>>
> 
> Good to know! In that case if in the future we think to upstream 
> something
> related with HDCP we will let you know. :)
> BTW, which versions of HDCP (1.4, 2.2, 2.3) the API supports?

It's designed for all versions, but it has only been tested with 1.4
receivers.

You can find it here:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=tc358840

BTW, don't wait for the follow-up review w.r.t. colorimetry, it might
take 1-2 weeks before I get around to that, I need to carve out time
for that. Feel free to post a v2 based on the current review.

Regards,

	Hans
