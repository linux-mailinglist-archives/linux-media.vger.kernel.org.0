Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 283FE6D97C0
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 15:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236840AbjDFNQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 09:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236684AbjDFNQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 09:16:12 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E5C59FA;
        Thu,  6 Apr 2023 06:16:07 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: lina@asahilina.net)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 75CE042529;
        Thu,  6 Apr 2023 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
        s=default; t=1680786965;
        bh=FXYWaCQJmvQ2uEK4t/LcGzB0UZXt8EVoDewSRAD9yQ4=;
        h=Date:Subject:To:References:From:Cc:In-Reply-To;
        b=EYu4KLeC3T6XjUipJywqNbLZTq2rmmytoRE7PPXKZhaFPmkDs3IOk/BY1b/euMIEt
         awIZZVpcIcRb0mDQxgtXHotjQjZRYOtKKbUsmDIKAJuck2+OVBKfKL8guPCLIDWgCd
         I2WzfPWu79kEAa1XTgmMOP8ZUuODKC2MiMnGxlBdmpfyGCQGJL7tHhbbdR6mk3LQsb
         DML/MQZG1f5azO+AA+dwTRhS1Z6EnnleeVSTaYK90uSkF0GIDTvxKCAjvBxyGnZ9B8
         P+7j/B90feZWEadJ0qavWrS6TX+sl6swTpmXBj6dKOFUYEiNiWSgyI8T/rU5NkIyCs
         KE4UYCnwILrXg==
Message-ID: <37e2861d-ab9f-6b83-9186-d9ffc6845e8a@asahilina.net>
Date:   Thu, 6 Apr 2023 22:15:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Linaro-mm-sig] Re: [PATCH RFC 18/18] drm/asahi: Add the Asahi
 driver for Apple AGX GPUs
Content-Language: en-US
To:     Daniel Vetter <daniel@ffwll.ch>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-18-917ff5bc80a8@asahilina.net>
 <ZC2HtBOaoUAzVCVH@phenom.ffwll.local>
 <8d28f1d3-14b0-78c5-aa16-e81e2a8a3685@asahilina.net>
 <ZC6zSnB6pSELiy+I@phenom.ffwll.local>
From:   Asahi Lina <lina@asahilina.net>
Cc:     David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Karol Herbst <kherbst@redhat.com>,
        Ella Stanforth <ella@iglunix.org>,
        Faith Ekstrand <faith.ekstrand@collabora.com>,
        Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-sgx@vger.kernel.org, asahi@lists.linux.dev
In-Reply-To: <ZC6zSnB6pSELiy+I@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/04/2023 20.55, Daniel Vetter wrote:
> On Thu, Apr 06, 2023 at 01:44:22PM +0900, Asahi Lina wrote:
>> On 05/04/2023 23.37, Daniel Vetter wrote:
>>> On Tue, Mar 07, 2023 at 11:25:43PM +0900, Asahi Lina wrote:
>>>> +/// A generic monotonically incrementing ID used to uniquely identify object instances within the
>>>> +/// driver.
>>>> +pub(crate) struct ID(AtomicU64);
>>>> +
>>>> +impl ID {
>>>> +    /// Create a new ID counter with a given value.
>>>> +    fn new(val: u64) -> ID {
>>>> +        ID(AtomicU64::new(val))
>>>> +    }
>>>> +
>>>> +    /// Fetch the next unique ID.
>>>> +    pub(crate) fn next(&self) -> u64 {
>>>> +        self.0.fetch_add(1, Ordering::Relaxed)
>>>> +    }
>>>> +}
>>>
>>> Continuing the theme of me commenting on individual things, I stumbled
>>> over this because I noticed that there's a lot of id based lookups where I
>>> don't expect them, and started chasing.
>>>
>>> - For ids use xarray, not atomic counters. Yes I know dma_fence timelines
>>>     gets this wrong, this goes back to an innocent time where we didn't
>>>     allocate more than one timeline per engine, and no one fixed it since
>>>     then. Yes u64 should be big enough for everyone :-/
>>>
>>> - Attaching ID spaces to drm_device is also not great. drm is full of
>>>     these mistakes. Much better if their per drm_file and so private to each
>>>     client.
>>>
>>> - They shouldn't be used for anything else than uapi id -> kernel object
>>>     lookup at the beginning of ioctl code, and nowhere else. At least from
>>>     skimming it seems like these are used all over the driver codebase,
>>>     which does freak me out. At least on the C side that's a clear indicator
>>>     for a refcount/lockin/data structure model that's not thought out at
>>>     all.
>>>
>>> What's going on here, what do I miss?
>>
>> These aren't UAPI IDs, they are driver-internal IDs (the UAPI IDs do use
>> xarray and are per-File). Most of them are just for debugging, so that when
>> I enable full debug spam I have some way to correlate different things that
>> are happening together (this subset of interleaved log lines relate to the
>> same submission). Basically just object names that are easier to read (and
>> less of a security leak) than pointers and guaranteed not to repeat. You
>> could get rid of most of them and it wouldn't affect the driver design, it
>> just makes it very hard to see what's going on with debug logs ^^;
>>
>> There are only two that are ever used for non-debugging purposes: the VM ID,
>> and the File ID. Both are per-device global IDs attached to the VMs (not the
>> UAPI VM objects, but rather the underlyng MMU address space managers they
>> represent, including the kernel-internal ones) and to Files themselves. They
>> are used for destroying GEM objects: since the objects are also
>> device-global across multiple clients, I need a way to do things like "clean
>> up all mappings for this File" or "clean up all mappings for this VM".
>> There's an annoying circular reference between GEM objects and their
>> mappings, which is why this is explicitly coded out in destroy paths instead
>> of naturally happening via Drop semantics (without that cleanup code, the
>> circular reference leaks it).
>>
>> So e.g. when a File does a GEM close or explicitly asks for all mappings of
>> an object to be removed, it goes out to the (possibly shared) GEM object and
>> tells it to drop all mappings marked as owned by that unique File ID. When
>> an explicit "unmap all in VM" op happens, it asks the GEM object to drop all
>> mappings for that underlying VM ID. Similarly, when a UAPI VM object is
>> dropped (in the Drop impl, so both explicitly and when the whole File/xarray
>> is dropped and such), that does an explicit unmap of a special dummy object
>> it owns which would otherwise leak since it is not tracked as a GEM object
>> owned by that File and therefore not handled by GEM closing. And again along
>> the same lines, the allocators in alloc.rs explicitly destroy the mappings
>> for their backing GEM objects on Drop. All this is due to that annoying
>> circular reference between VMs and GEM objects that I'm not sure how to fix.
>>
>> Note that if I *don't* do this (or forget to do it somewhere) the
>> consequence is just that we leak memory, and if you try to destroy the wrong
>> IDs somehow the worst that can happen is you unmap things you shouldn't and
>> fault the GPU (or, in the kernel or kernel-managed user VM cases,
>> potentially the firmware). Rust safety guarantees still keep things from
>> going entirely off the rails within the kernel, since everything that
>> matters is reference counted (which is why these reference cycles are
>> possible at all).
>>
>> This all started when I was looking at the panfrost driver for reference. It
>> does the same thing except it uses actual pointers to the owning entities
>> instead of IDs, and pointer comparison (see panfrost_gem_close). Of course
>> you could try do that in Rust too (literally storing and comparing raw
>> pointers that aren't owned references), but then you're introducing a Pin<>
>> requirement on those objects to make their addresses stable and it feels way
>> more icky and error-prone than unique IDs (since addresses can be reused).
>> panfrost only has a single mmu (what I call the raw VM) per File while I
>> have an arbitrary number, which is why I end up with the extra
>> distinction/complexity of both File and VM IDs, but the concept is the same.
>>
>> Some of this is going to be refactored when I implement arbitrary VM range
>> mapping/unmapping, which would be a good time to improve this... but is
>> there something particularly wrong/broken about the way I'm doing it now
>> that I missed? I figured unique u64 IDs would be a pretty safe way to
>> identify entities and cleanup the mappings when needed.
> 
> Ok, some attempt at going through the vm_id/file_id stuff. Extremely
> high-level purely informed by having read too many drivers:
> 
> First on the drm_file/struct file/file_id. This is the uapi interface
> object, and it's refcounted in the vfs, but that's entirely the vfs'
> business and none of the driver (or even subsystem). Once userspace has
> done the final close() the file is gone, there's no way to ever get
> anything meaningfully out of it because userspace dropped it. So if the
> driver has any kind of backpointer to that's a design bug, because in all
> the place you might want to care (ioctl, fdinfo for schedu stats, any
> other file_operations callback) the vfs ensures it stays alive during the
> callback and you essentially have a borrowed reference.

Right, there's none of that for the File, and it is not refcounted 
itself. Certainly there are no direct references, and as for the IDs: 
the IDs of relevant Files live in GEM objects that hold mappings owned 
by that file. As part of File close all the GEM objects get closed, 
which removes those mappings. So by the time the File goes away there 
should be no references to its ID anywhere (other than if I stashed some 
away for debugging, I forget whether I did in some child object).

If this process breaks for some reason (say, stray mappings remain 
indexed to a File ID that is gone), that means we leak the mappings, 
which leaks the GEM objects themselves and the VM they are mapped to. 
Not great but not fireworks either. As long as the DRM core properly 
calls the GEM close callback on everything before calling the File close 
callback though, that shouldn't happen.

> I've seen a lot of drivers try to make clever backpointings to stuff
> that's essentially tied to the drm_file, and I've not found a single case
> that made sense. iow, file_id as a lookup thingie needs to go. In
> principle it's the same argument I've made already for the syncobj rust
> wrappers. For specific uses I guess I need some rust reading help, but
> from your description it sounds like the vm_id is much more the core
> piece.

The file ID is simply how GEM mappings are identified as belonging to an 
active file within the mapping list of an object. GEM object close is 
literally the only place this ID is ever used for anything other than 
passing around:

/// Callback to drop all mappings for a GEM object owned by a given `File`
fn close(obj: &Object, file: &DrmFile) {
     mod_pr_debug!("DriverObject::close vm_id={:?} id={}\n", obj.vm_id, 
obj.id);
     obj.drop_file_mappings(file.inner().file_id());
}

I could also just iterate through the VM XArray for the File and drop 
mappings one VM at a time instead of doing all of them in one go, it's 
just slightly more cumbersome (though potentially less code because I 
could get rid of all the forwarding the file_id I do now).

On the other hand, once we implement arbitrary VM maps, I suspect this 
is going to go away anyway with the new design, so I'm not really very 
inclined to fix it until that happens... ^^

> So for that we have the gpu ctx -> vm -> gem_bos chain of reference. Now
> on the C side if you have a modern driver that uses the
> vm_bind/unbind/gpuva manager approach, the reference counts go in that
> single direction only, anything else is essentially borrowed references
> under protection of a mutex/lock or similar thing (for e.g. going from the
> bo to the vm for eviction).

Right, so that is what is going to change with the pending refactor. 
What I have right now is a design that used to be the old driver-managed 
VM design (and still retains part of that for kernel-managed objects) 
for the old synchronous demo UAPI, that I then shoehorned into the 
redesigned vm_bind UAPI by just not supporting the interesting cases 
(partial maps/unmaps/remaps, etc.). This is all temporary, it's just to 
get us by for now since OpenGL doesn't need it and there is no usable 
Vulkan driver that cares yet... I wanted to focus on the explicit sync 
and general sched/queuing part of the new UAPI before I got to the VM 
bind stuff, since I figured that would be more interesting (and pulls in 
all the new abstractions, plus major perf benefit). So the UAPI itself 
has vm_bind but only the "easy" subset of cases are supported by the 
driver (whole object maps/unmaps) and the refcounting is still backwards.

As I said this originally came from the Panfrost design that doesn't 
have vm_bind but instead keeps a list of mappings with pointer equality 
checks in BOs... so that's why ^^

Thanks for explaining the design approach though, it's roughly what I 
had in mind but it's good to hear I'm on the right track! I'd love to go 
into more detail about how to implement vm_bind if you have time though 
(maybe a meeting?). In particular things like using the mm allocator to 
keep track of mapping ranges and supporting splitting and all that.

> In addition to the above chain the xarray in the drm_file also holds
> references to each of these. So far so good, in the drm_file ->postclose
> callback you just walk the xarrays and drop all the references, and
> everything gets cleaned up, at least in the C world.

In the Rust world you just do nothing since the XArray abstraction knows 
how to drop all of its contained objects!

> But if either due to the uabi being a bit more legacy, or Rust requiring
> that the backpointers are reference-counted from the gem_bo->vma->vm and
> can't follow borrow semantics (afaiui the usual linux list_head pattern of
> walking the list under a lock giving you a borrowed reference for each
> element doesn't work too well in rust?) then that's not a problem, you can
> still all clean it out:
> 
> - The key bit is that your vm struct needs both a refcount like kref and
>    a separate open count. Each gpu ctx and the xarray for vm objects in
>    drm_file hold _both_ the kref and the open refcount (in rust the open
>    refcount implies the Arc or things go sideways).
> 
> - the other key bit is that drm_file ->postclose does _not_ have simple
>    Drop semantics, it's more explicit.
> 
> - in the drm_file lastclose you first walk all the gpu ctx. The simplest
>    semantics is that close() synchronously tears down all leftover gpu ctx,
>    i.e. you unload them from the gpu. Details are under a lot of discussion
>    in the various scheduler threads, but essentially this should ensure
>    that the gpu ctx destruction completely removes all references to the
>    ctx. If instead you have the legacy problem of apps expecting that
>    rendering continues even if they called exit() before it finishes, then
>    it gets more messy. I have no idea whether that's still a problem for
>    new drivers or can be avoided.
> 
> - Next up you do the same thing for the vm xarray (which drops both the
>    kref an open refcounts).
> 
> - At this point there might still be a ton of vm objects around with
>    elevated kref. Except not, because at this point the open refcount of
>    each vm should have dropped to zero. When that happens the vm object
>    itself is still alive, plus even better for rust, you are in the
>    vm_close(vm) function call so you have a full borrowed reference to
>    that. Which means you can walk the entire address space and unmap
>    everything explicit. Which should get rid of any gem_bo->vma->vm
>    backpointers you have lying around.
> 
> - At that point all your vm objects are gone too, because the kref managed
>    backpointers are gone.
> 
> - You walk the xarray of gem_bo (well the drm subsystem does that for
>    you), which cleans out the reamining references to gem_bo. Only the
>    gem_bo which are shared with other process or have a dma_buf will
>    survive, like they should.
> 
> No leak, no funky driver-internal vm_id based lookup, and with rust we
> should even be able to guarantee you never mix up Arc<Vm> with OpenRef<Vm>
> (or however that exactly works in rust types, I have not much real clue).

That would totally work, and actually I already use somewhat analogous 
mechanisms in other places like firmware queues!

If this all weren't getting turned on its head for the new VM management 
I'd implement it, but hopefully we can agree there's not much point 
right now... I'd rather focus on the DRM abstraction design and work on 
improving the driver in parallel right now, and then about one kernel 
cycle or so from now it should definitely be in a better place for 
review. Honestly, there are bigger design problems with the driver right 
now than these IDs (that I already know about)... so I want to focus 
more on the abstractions and their usage right now than the internal 
driver design which I *know* has problems ^^

Rust is really good at getting you to come up with a *safe* design as 
far as memory and ownership, but that doesn't mean it's perfectly clean 
code and more importantly it does nothing for deadlocks and allocating 
in the wrong paths and getting resource allocation semantics right etc 
etc. The GPU FW queue stuff is at the very least due for another major 
refactor/cleanup to defer resource allocation and actual queuing to job 
prepare/run time (right now there's some horrible hacks to do it upfront 
at submit because I don't have a mechanism to back-patch job structures 
with those resource IDs later at exec time, but I want to add that), and 
along the way I can also fix the using job fences to block on pending 
job count thing that Christian really wants me to do instead of the 
can_run_job thing, and then getting all this resource stuff truly right 
is also going to mean eventually using fences to handle blocking on 
resource exhaustion too (though maybe I can get away with implementing 
that a bit later)...

The driver works stupidly well for how quickly I wrote it, but it still 
has all these rough edges that definitely need fixing before it's 
something I could say I'm happy with... I'm sure if you start hammering 
it with evil workloads you will hit some of its current problems (like I 
did yesterday with the deadlocks on GpuContext inval). I also need to 
learn more about the subtleties of fence signaling and all that, 
especially once a shrinker comes into play...

~~ Lina

