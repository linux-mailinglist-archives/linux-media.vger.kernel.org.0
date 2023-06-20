Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7CFD736A9A
	for <lists+linux-media@lfdr.de>; Tue, 20 Jun 2023 13:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbjFTLNt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jun 2023 07:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbjFTLNs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jun 2023 07:13:48 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859AAB2
        for <linux-media@vger.kernel.org>; Tue, 20 Jun 2023 04:13:47 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35KBDfIi109877;
        Tue, 20 Jun 2023 06:13:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1687259621;
        bh=bi8313S3HkxdFv45NUWJgiI45nwYZmQtsj64O+bRJuM=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=mkm9hVTFp5PE1lasv0CkrUb+oFQ01ykAgtjICTGZxG/+ttMcMl9R9CAdUzmTZyEoI
         9oRnk2JX7FUoBGad4ymdp1Q6HRvvsYyEHA79Vd4M3fheVyxEJq9h+62CQZwfpRGiWp
         Lf2dIV3y46WLwSFoSBERD7G+7ZWLbxxqgtfXbwx8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35KBDfNT030737
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Jun 2023 06:13:41 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Jun 2023 06:13:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 06:13:41 -0500
Received: from [172.24.145.199] (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35KBDdb9108482;
        Tue, 20 Jun 2023 06:13:40 -0500
Message-ID: <cf7cd716-22b2-917a-c3db-413fd451410c@ti.com>
Date:   Tue, 20 Jun 2023 16:43:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [ANN] Media Summit June 26th: Please let me know if you will
 attend
Content-Language: en-US
To:     Tommaso Merciai <tomm.merciai@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Martin Hecht <martin.hecht@avnet.eu>,
        Michael Roeder <michael.roeder@avnet.eu>
References: <aec8b9e1-25d4-d0bc-63b6-68ff06e06683@xs4all.nl>
 <ZHCoYqlctSsqSUHE@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
From:   Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZHCoYqlctSsqSUHE@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 26/05/23 18:08, Tommaso Merciai wrote:
> Hello Hans,
> 
> On Mon, May 15, 2023 at 04:34:20PM +0200, Hans Verkuil wrote:
>> Hi all,
>>
>> We organized a Media Summit on Monday June 26th in Prague. It is held
>> at the Holiday Inn close by the conference centre where the Embedded
>> Open Source Summit is held (1).
>>
>> Holiday Inn Prague Congress Centre - Meeting room "E"
>> Na Pankráci 1684/ 15, 140 00 Praha 4-Nusle
>> https://www.ihg.com/holidayinn/hotels/us/en/prague/prgnp/hoteldetail
>>
>> We have room for about 20 people, so let me know if you plan to attend
>> in person. That way we know how many people we'll get.
> 
> Thanks for your effort on support/create this event.
> 
> I don't have particular topics. I would like to attend in person too, if possible.
> In real we are me and other 2 guys that are in cc (Martin Hecht and Michael Roeder).
> 
> Let me know if can be possible for us to partecipate at this event.
> Many thanks! :)
> 
> Regards,
> Tommaso
> 
>>
>> Regarding remote participation: only if there is really no other way.
>> Meeting face-to-face once a year is important IMHO, and attending remotely
>> is a poor substitute. That said, if it is really necessary to set something
>> up, then I can do the same I did in Dublin, setting up a Webex meeting.
>> That worked reasonably well, except that I will need to bring a better
>> speaker since I learned that the laptop speaker was pretty bad.
>>
>> If you do want to participate remotely, please let me know as well.
>>

Thanks for organizing this and sorry for the late intimation, I am interested
to participate remotely too as not able to travel. I am from Texas Instruments
and currently working on linux media related driver and frameworks.

Could you please let me know if it's possible for me to attend remotely ?

Regards
Devarsh

>> I'll post a separate email with the draft Agenda for the media summit.
>>
>> Hope to see you all in Prague!
>>
>> Regards,
>>
>> 	Hans
>>
>> (1) https://events.linuxfoundation.org/embedded-open-source-summit/
> 
> 
