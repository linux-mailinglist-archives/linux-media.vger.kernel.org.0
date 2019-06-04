Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF6E9344B9
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 12:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbfFDKtU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 4 Jun 2019 06:49:20 -0400
Received: from mail-oln040092065061.outbound.protection.outlook.com ([40.92.65.61]:47235
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727139AbfFDKtT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 06:49:19 -0400
Received: from VE1EUR01FT011.eop-EUR01.prod.protection.outlook.com
 (10.152.2.52) by VE1EUR01HT176.eop-EUR01.prod.protection.outlook.com
 (10.152.2.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.19; Tue, 4 Jun
 2019 10:49:14 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com (10.152.2.53) by
 VE1EUR01FT011.mail.protection.outlook.com (10.152.2.229) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1943.19 via Frontend Transport; Tue, 4 Jun 2019 10:49:14 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::fdae:4944:7c73:c26a]) by VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::fdae:4944:7c73:c26a%6]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 10:49:13 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Boris Brezillon <boris.brezillon@collabora.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        "Alexandre Courbot" <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Thread-Topic: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Thread-Index: AQHVCwZV113RJIvxkU+HTUkBX8F+66aJ59yAgAB9JQCAAA2RgIAA11KAgAAE3YCAAATRAIAAAneAgAAGbACAABPEgA==
Date:   Tue, 4 Jun 2019 10:49:13 +0000
Message-ID: <VI1PR03MB4206D752EBA7D53FF2563B0EAC150@VI1PR03MB4206.eurprd03.prod.outlook.com>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <20190603112449.GA30132@ulmo>
 <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
 <20190603214117.664f6ba1@collabora.com> <20190604083157.GC9048@ulmo>
 <20190604104921.5f4dcbe8@collabora.com> <20190604090636.GF9048@ulmo>
 <VI1PR03MB4206CA39BCD520111EF9844AAC150@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <20190604113824.6d9fb135@collabora.com>
In-Reply-To: <20190604113824.6d9fb135@collabora.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0102CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::41) To VI1PR03MB4206.eurprd03.prod.outlook.com
 (2603:10a6:803:51::23)
x-incomingtopheadermarker: OriginalChecksum:55F52A4604438F3CCAA4FB66C7CCCD75A5B5BD40DCA463B138EFACAC2A906657;UpperCasedChecksum:992D522281F6FF2CC6730BE5C40E2F3A1BAEB5656FDDF95B73FD8050EC795486;SizeAsReceived:8281;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [jsOZ59HGveIwP9lmxbohfxDNjYXt9yvB]
x-microsoft-original-message-id: <2f41970b-75b2-0593-8e21-da319b5c5e4a@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:VE1EUR01HT176;
x-ms-traffictypediagnostic: VE1EUR01HT176:
x-microsoft-antispam-message-info: jz3HNIqiQNIiHfCWiEjPhZAOj5QXqPRVZ3X8nFPXUdlTG8rEZ9kJsHFLXm3tCwEsUuD+aF9YQul+TX9COj4+ISGlep7z3hVnT7QrWd8sJNQKfec8H4LdWpJe2ju/UAkl9P+P7iod+IX5AZguyn2BepYPf02NBBQlBsNR2GPsPZOGCS8s9JkfjY+VkM6Sj03P
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <5C9D4BC593C5544C87931BD5B2980636@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a7a0cd-917e-455e-62dc-08d6e8da485c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 10:49:13.8240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT176
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019-06-04 11:38, Boris Brezillon wrote:
> On Tue, 4 Jun 2019 09:15:28 +0000
> Jonas Karlman <jonas@kwiboo.se> wrote:
>
>> On 2019-06-04 11:06, Thierry Reding wrote:
>>> On Tue, Jun 04, 2019 at 10:49:21AM +0200, Boris Brezillon wrote:  
>>>> On Tue, 4 Jun 2019 10:31:57 +0200
>>>> Thierry Reding <thierry.reding@gmail.com> wrote:
>>>>  
>>>>>>>>> - Using flags
>>>>>>>>>
>>>>>>>>> The current MPEG-2 controls have lots of u8 values that can be
>>>>>>>>> represented as flags. Using flags also helps with padding.
>>>>>>>>> It's unlikely that we'll get more than 64 flags, so using a u64 by
>>>>>>>>> default for that sounds fine (we definitely do want to keep some room
>>>>>>>>> available and I don't think using 32 bits as a default is good enough).
>>>>>>>>>
>>>>>>>>> I think H.264/HEVC per-control flags should also be moved to u64.      
>>>>>>>> There was also some concensus on this, that u64 should be good enough
>>>>>>>> for anything out there, though we obviously don't know what the future
>>>>>>>> will hold, so perhaps adding some way for possible extending this in the
>>>>>>>> future might be good. I guess we'll get new controls for new codecs
>>>>>>>> anyway, so we can punt on this until then.
>>>>>>>>       
>>>>>>>>> - Clear split of controls and terminology
>>>>>>>>>
>>>>>>>>> Some codecs have explicit NAL units that are good fits to match as
>>>>>>>>> controls: e.g. slice header, pps, sps. I think we should stick to the
>>>>>>>>> bitstream element names for those.
>>>>>>>>>
>>>>>>>>> For H.264, that would suggest the following changes:
>>>>>>>>> - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_header;
>>>>>>>>> - killing v4l2_ctrl_h264_decode_param and having the reference lists
>>>>>>>>> where they belong, which seems to be slice_header;      
>>>>>>> But now here it's being described per slice. When I look at the slice
>>>>>>> header, I only see list of modifications and when I look at userspace,
>>>>>>> That list is simply built from DPB, the modifications list found in the
>>>>>>> slice header seems to be only used to craft the l0/l1 list.    
>>>>>> Yes, I think there was a misunderstanding which was then clarified
>>>>>> (unfortunately it happened on IRC, so we don't have a trace of this
>>>>>> discussion). The reference list should definitely be per-frame, and the
>>>>>> L0/L1 slice reflists are referring to the per-frame reference list (it's
>>>>>> just a sub-set of the per-frame reflist re-ordered differently).
>>>>>>     
>>>>>>> There is one thing that come up though, if we enable per-frame decoding
>>>>>>> on top of per-slice decoder (like Cedrus), won't we force userspace to
>>>>>>> always compute l0/l1 even though the HW might be handling that ?    
>>>>>> That's true, the question is, what's the cost of this extra re-ordering?    
>>>>> I think ultimately userspace is already forced to compute these lists
>>>>> even if some hardware may be able to do it in hardware. There's going to
>>>>> be other hardware that userspace wants to support that can't do it by
>>>>> itself, so userspace has to at least have the code anyway. What it could
>>>>> do on top of that decide not to run that code if it somehow detects that
>>>>> hardware can do it already. On the other hand this means that we have to
>>>>> expose a whole lot of capabilities to userspace and userspace has to go
>>>>> and detect all of them in order to parameterize all of the code.
>>>>>
>>>>> Ultimately I suspect many applications will just choose to pass the data
>>>>> all the time out of simplicity. I mean drivers that don't need it will
>>>>> already ignore it (i.e. they must not break if they get the extra data)
>>>>> so other than the potential runtime savings on some hardware, there are
>>>>> no advantages.
>>>>>
>>>>> Given that other APIs don't bother exposing this level of control to
>>>>> applications makes me think that it's just not worth it from a
>>>>> performance point of view.  
>>>> That's not exactly what Nicolas proposed. He was suggesting that we
>>>> build those reflists kernel-side: V4L would provide an helper and
>>>> drivers that need those lists would use it, others won't. This way we
>>>> have no useless computation done, and userspace doesn't even have to
>>>> bother checking the device caps to avoid this extra step.  
>>> Oh yeah, that sounds much better. I suppose one notable differences to
>>> other APIs is that they have to pass in buffers for all the frames in
>>> the DPB, so they basically have to build the lists in userspace. Since
>>> we'll end up looking up the frames in the kernel, it sounds reasonable
>>> to also build the lists in the kernel.  
>> Userspace must already process the modification list or it wont have correct DPB for next frame.
> Can you point us to the code or the section in the spec that
> mentions/proves this dependency? I might have missed something, but my
> understanding was that the slice ref lists (or the list of
> modifications to apply to the list of long/short refs attached to a
> frame) had no impact on the list of long/short refs attached to the
> following frame.

I must have mixed up the marking process with the modification process.
You seem to be correct, the modification process should not affect the short/long-term
reference marking if I understand the spec and code correctly.

Regards,
Jonas
