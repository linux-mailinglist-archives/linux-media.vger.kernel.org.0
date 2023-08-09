Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10ADF775438
	for <lists+linux-media@lfdr.de>; Wed,  9 Aug 2023 09:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbjHIHeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 03:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjHIHeK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 03:34:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2E910C6
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 00:34:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 252AD62FF3
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 07:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07436C433C8;
        Wed,  9 Aug 2023 07:34:03 +0000 (UTC)
Message-ID: <00f53c06-e66d-aa46-ca4f-c3baab6cf455@xs4all.nl>
Date:   Wed, 9 Aug 2023 09:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [libcamera-devel] [virtio-dev] Re: [RFC PATCH v6] virtio-video:
 Add virtio video device specification
Content-Language: en-US, nl
To:     Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        virtio-dev@lists.oasis-open.org,
        Albert Esteve <aesteve@redhat.com>,
        =?UTF-8?Q?Matti_M=c3=b6ll?= <Matti.Moell@opensynergy.com>,
        Andrew Gazizov <andrew.gazizov@opensynergy.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Marcin Wojtas <mwojtas@google.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Alexander Gordeev <alexander.gordeev@opensynergy.com>,
        libcamera-devel@lists.libcamera.org,
        =?UTF-8?Q?Bart=c5=82omiej_Grzesik?= <bag@semihalf.com>,
        Enrico Granata <egranata@google.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        linux-media@vger.kernel.org
References: <11372cda-a766-ef50-45d7-ed637b72a31c@opensynergy.com>
 <CAPBb6MVRPn6dM8ap9uDvX_ZHdHGvooq+LB7UGDaWBEuUtK3x=A@mail.gmail.com>
 <cbed366a-7f12-8642-18ef-350981279241@opensynergy.com>
 <87a5ylzf34.fsf@redhat.com> <87354dtp30.fsf@linaro.org>
 <87bkj1h0nf.fsf@redhat.com>
 <a3607ef3-ffd9-345b-0191-5bc946f4be19@opensynergy.com>
 <168329085253.1880445.14002473591422425775@Monstersaurus>
 <87v8h6dagr.fsf@linaro.org>
 <20230506081229.GA8114@pendragon.ideasonboard.com>
 <20230506081633.GB8114@pendragon.ideasonboard.com>
 <CAPBb6MW5K79MswL7GKJBqgNYP-e3YP3P8n+wBpFS4AaqGQFbbg@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAPBb6MW5K79MswL7GKJBqgNYP-e3YP3P8n+wBpFS4AaqGQFbbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

On 08/05/2023 10:00, Alexandre Courbot wrote:
> Just to add some context for linux-media@, as I think it may be
> missing from the quoted thread:
> 
> The virtio-video specification has been dragging for quite some time,
> and the more it progresses the more it starts looking like V4L2 with
> different names. So I suggested that we just encapsulate V4L2 syscalls
> into virtio descriptors and basically use the V4L2 model for video
> device virtualization. The benefits would be a much shorter
> virtio-video specification, and support for other kinds of V4L2
> devices like cameras.
> 
> I tried to write a quick prototype to test the idea and it works well
> enough to expose a USB webcam or the vicodec decoder/encoder using the
> same guest driver:
> 
> https://github.com/Gnurou/linux/blob/virtio-v4l2/drivers/media/virtio-v4l2/virtio_v4l2_driver.c
> 
> (driver not supposed to be upstreamed as-is ; it was quickly put
> together to check whether the idea could fly).
> 
> It would be interesting to hear what the V4L2 maintainers and active
> contributors think of this idea. IMHO it provides much more bang for
> the buck than having to write new specifications for codec and camera
> virtualization, but there are arguments that V4L2 would be too complex
> for virtualizing video codecs, and is overall not specified as
> precisely as virtio-video would be.

One of the main problems with cameras and codecs is that technology keeps
evolving and APIs need to adapt continuously. It's a painful process and
replicating that process in another API seems to me something you would
want to avoid if at all possible.

So Alexander's proposal is IMHO something you should seriously consider.

And w.r.t. codecs whatever API you come up with will be very similar to the
V4L2 API: there aren't that many ways you can do decoding, for example, and
a lot of that is defined by the underlying standards.

Regards,

	Hans

> 
> On Sat, May 6, 2023 at 5:16 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> I'm also CC'ing the linux-media@vger.kernel.org mailing list for these
>> discussions, I'm sure there are folks there who are interested in codec
>> and camera virtualization.
>>
>> On Sat, May 06, 2023 at 11:12:29AM +0300, Laurent Pinchart via libcamera-devel wrote:
>>> On Fri, May 05, 2023 at 04:55:33PM +0100, Alex Bennée via libcamera-devel wrote:
>>>> Kieran Bingham writes:
>>>>> Quoting Alexander Gordeev (2023-05-05 10:57:29)
>>>>>> On 03.05.23 17:53, Cornelia Huck wrote:
>>>>>>> On Wed, May 03 2023, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>>>>> Cornelia Huck <cohuck@redhat.com> writes:
>>>>>>>>> On Fri, Apr 28 2023, Alexander Gordeev <alexander.gordeev@opensynergy.com> wrote:
>>>>>>>>>> On 27.04.23 15:16, Alexandre Courbot wrote:
>>>>>>>>>>> But in any case, that's irrelevant to the guest-host interface, and I
>>>>>>>>>>> think a big part of the disagreement stems from the misconception that
>>>>>>>>>>> V4L2 absolutely needs to be used on either the guest or the host,
>>>>>>>>>>> which is absolutely not the case.
>>>>>>>>>>
>>>>>>>>>> I understand this, of course. I'm arguing, that it is harder to
>>>>>>>>>> implement it, get it straight and then maintain it over years. Also it
>>>>>>>>>> brings limitations, that sometimes can be workarounded in the virtio
>>>>>>>>>> spec, but this always comes at a cost of decreased readability and
>>>>>>>>>> increased complexity. Overall it looks clearly as a downgrade compared
>>>>>>>>>> to virtio-video for our use-case. And I believe it would be the same for
>>>>>>>>>> every developer, that has to actually implement the spec, not just do
>>>>>>>>>> the pass through. So if we think of V4L2 UAPI pass through as a
>>>>>>>>>> compatibility device (which I believe it is), then it is fine to have
>>>>>>>>>> both and keep improving the virtio-video, including taking the best
>>>>>>>>>> ideas from the V4L2 and overall using it as a reference to make writing
>>>>>>>>>> the driver simpler.
>>>>>>>>>
>>>>>>>>> Let me jump in here and ask another question:
>>>>>>>>>
>>>>>>>>> Imagine that, some years in the future, somebody wants to add a virtio
>>>>>>>>> device for handling video encoding/decoding to their hypervisor.
>>>>>>>>>
>>>>>>>>> Option 1: There are different devices to chose from. How is the person
>>>>>>>>> implementing this supposed to pick a device? They might have a narrow
>>>>>>>>> use case, where it is clear which of the devices is the one that needs to
>>>>>>>>> be supported; but they also might have multiple, diverse use cases, and
>>>>>>>>> end up needing to implement all of the devices.
>>>>>>>>>
>>>>>>>>> Option 2: There is one device with various optional features. The person
>>>>>>>>> implementing this can start off with a certain subset of features
>>>>>>>>> depending on their expected use cases, and add to it later, if needed;
>>>>>>>>> but the upfront complexity might be too high for specialized use cases.
>>>>>>>>>
>>>>>>>>> Leaving concrete references to V4L2 out of the picture, we're currently
>>>>>>>>> trying to decide whether our future will be more like Option 1 or Option
>>>>>>>>> 2, with their respective trade-offs.
>>>>>>>>>
>>>>>>>>> I'm slightly biased towards Option 2; does it look feasible at all, or
>>>>>>>>> am I missing something essential here? (I had the impression that some
>>>>>>>>> previous confusion had been cleared up; apologies in advance if I'm
>>>>>>>>> misrepresenting things.)
>>>>>>>>>
>>>>>>>>> I'd really love to see some kind of consensus for 1.3, if at all
>>>>>>>>> possible :)
>>>>>>>>
>>>>>>>> I think feature discovery and extensibility is a key part of the VirtIO
>>>>>>>> paradigm which is why I find the virtio-v4l approach limiting. By
>>>>>>>> pegging the device to a Linux API we effectively limit the growth of the
>>>>>>>> device specification to as fast as the Linux API changes. I'm not fully
>>>>>>>> immersed in v4l but I don't think it is seeing any additional features
>>>>>>>> developed for it and its limitations for camera are one of the reasons
>>>>>>>> stuff is being pushed to userspace in solutions like libcamera:
>>>>>>>>
>>>>>>>>    How is libcamera different from V4L2?
>>>>>>>>
>>>>>>>>    We see libcamera as a continuation of V4L2. One that can more easily
>>>>>>>>    handle the recent advances in hardware design. As embedded cameras have
>>>>>>>>    developed, all of the complexity has been pushed on to the developers.
>>>>>>>>    With libcamera, all of that complexity is simplified and a single model
>>>>>>>>    is presented to application developers.
>>>>>>>
>>>>>>> Ok, that is interesting; thanks for the information.
>>>>>>>
>>>>>>>>
>>>>>>>> That said its not totally our experience to have virtio devices act as
>>>>>>>> simple pipes for some higher level protocol. The virtio-gpu spec says
>>>>>>>> very little about the details of how 3D devices work and simply offers
>>>>>>>> an opaque pipe to push a (potentially propriety) command stream to the
>>>>>>>> back end. As far as I'm aware the proposals for Vulkan and Wayland
>>>>>>>> device support doesn't even offer a feature bit but simply changes the
>>>>>>>> graphics stream type in the command packets.
>>>>>>>>
>>>>>>>> We could just offer a VIRTIO_VIDEO_F_V4L feature bit, document it as
>>>>>>>> incompatible with other feature bits and make that the baseline
>>>>>>>> implementation but it's not really in the spirit of what VirtIO is
>>>>>>>> trying to achieve.
>>>>>>>
>>>>>>> I'd not be in favour of an incompatible feature flag,
>>>>>>> either... extensions are good, but conflicting features is something
>>>>>>> that I'd like to avoid.
>>>>>>>
>>>>>>> So, given that I'd still prefer to have a single device: How well does
>>>>>>> the proposed virtio-video device map to a Linux driver implementation
>>>>>>> that hooks into V4L2?
>>>>>>
>>>>>> IMO it hooks into V4L2 pretty well. And I'm going to spend next few
>>>>>> months making the existing driver fully V4L2 compliant. If this goal
>>>>>> requires changing the spec, than we still have time to do that. I don't
>>>>>> expect a lot of problems on this side. There might be problems with
>>>>>> Android using V4L2 in weird ways. Well, let's see. Anyway, I think all
>>>>>> of this can be accomplished over time.
>>>>>>
>>>>>>> If the general process flow is compatible and it
>>>>>>> is mostly a question of wiring the parts together, I think pushing that
>>>>>>> part of the complexity into the Linux driver is a reasonable
>>>>>>> trade-off. Being able to use an existing protocol is nice, but if that
>>>>>>> protocol is not perceived as flexible enough, it is probably not worth
>>>>>>> encoding it into a spec. (Similar considerations apply to hooking up the
>>>>>>> device in the hypervisor.)
>>>>>>
>>>>>> I very much agree with these statements. I think this is how it should
>>>>>> be: we start with a compact but usable device, then add features and
>>>>>> enable them using feature flags. Eventually we can cover all the
>>>>>> use-cases of V4L2 unless we decide to have separate devices for them
>>>>>> (virtio-camera, etc). This would be better in the long term I think.
>>>>>
>>>>> Camera's definitely have their quirks - mostly because many usecases are
>>>>> hard to convey over a single Video device node (with the hardware) but I
>>>>> think we might expect that complexity to be managed by the host, and
>>>>> probably offer a ready made stream to the guest. Of course how to handle
>>>>> multiple streams and configuration of the whole pipeline may get more
>>>>> difficult and warrant a specific 'virtio-camera' ... but I would think
>>>>> the basics could be covered generically to start with.
>>>>>
>>>>> It's not clear who's driving this implementation and spec, so I guess
>>>>> there's more reading to do.
>>>>>
>>>>> Anyway, I've added Cc libcamera-devel to raise awareness of this topic
>>>>> to camera list.
>>>>>
>>>>> I bet Laurent has some stronger opinions on how he'd see camera's exist
>>>>> in a virtio space.
>>>
>>> You seem to think I have strong opinions about everything. This may not
>>> be a complitely unfounded assumption ;-)
>>>
>>> Overall I agree with you, I think cameras are too complex for a
>>> low-level virtualization protocol. I'd rather see a high-level protocol
>>> that exposes webcam-like devices, with the low-level complexity handled
>>> on the host side (using libcamera of course ;-)). This would support use
>>> cases that require sharing hardware blocks between multiple logical
>>> cameras, including sharing the same camera streams between multiple
>>> guests.
>>>
>>> If a guest needs low-level access to the camera, including the ability
>>> to control the raw camera sensor or ISP, then I'd recommend passing the
>>> corresponding hardware blocks to the guest for exclusive access.
>>>
>>>> Personally I would rather see a separate virtio-camera specification
>>>> that properly encapsulates all the various use cases we have for
>>>> cameras. In many ways just processing a stream of video is a much
>>>> simpler use case.
>>>>
>>>> During Linaro's Project Stratos we got a lot of feedback from members
>>>> who professed interest in a virtio-camera initiative. However we were
>>>> unable to get enough engineering resources from the various companies to
>>>> collaborate in developing a specification that would meet everyone's
>>>> needs. The problem space is wide from having numerous black and white
>>>> sensor cameras on cars to the full on computational photography as
>>>> exposed by modern camera systems on phones. If you want to read more
>>>> words on the topic I wrote a blog post at the time:
>>>>
>>>>   https://www.linaro.org/blog/the-challenges-of-abstracting-virtio/
>>>>
>>>> Back to the topic of virtio-video as I understand it the principle
>>>> features/configurations are:
>>>>
>>>>   - All the various CODECs, resolutions and pixel formats
>>>>   - Stateful vs Stateless streams
>>>>   - If we want support grabbing single frames from a source
>>>>
>>>> My main concern about the V4L approach is that it pegs updates to the
>>>> interface to the continuing evolution of the V4L interface in Linux. Now
>>>> maybe video is a solved problem and there won't be (m)any new features
>>>> we need to add after the initial revision. However I'm not a domain
>>>> expert here so I just don't know.
>>>
>>> I've briefly discussed "virtio-v4l2" with Alex Courbot a few weeks ago
>>> when we got a chance to meet face to face. I think the V4L2 kernel API
>>> is a quite good fit in the sense that its level of abstraction, when
>>> applied to video codecs and "simple" cameras (defined, more or less, as
>>> something ressembling a USB webcam feature-wise). It doesn't mean that
>>> the virtio-video or virtio-camera specifications should necessarily
>>> reference V4L2 or use the exact same vocabulary, they could simply copy
>>> the concepts, and stay loosely-coupled with V4L2 in the sense that both
>>> specification should try to evolve in compatible directions.
>>
>> --
>> Regards,
>>
>> Laurent Pinchart

