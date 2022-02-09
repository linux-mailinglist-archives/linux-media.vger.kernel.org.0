Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1AD94AEBF2
	for <lists+linux-media@lfdr.de>; Wed,  9 Feb 2022 09:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235609AbiBIIMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Feb 2022 03:12:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbiBIIMe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Feb 2022 03:12:34 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC59BC0613CA
        for <linux-media@vger.kernel.org>; Wed,  9 Feb 2022 00:12:38 -0800 (PST)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4F5DA1B00120;
        Wed,  9 Feb 2022 10:12:35 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1644394355;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/duAtD7EICn0sGy5Kc7vI8YUIa/Poi/OW9Ae+oD9LYM=;
        b=AxQMwAOvlqjsvn7QCrE5vFQqAAWIqGUmotAS5GQbnQYT9nxBElBG1pX377yMWYDETRaPKz
        5OemREDZ8M4k3mXEujKXCtzm9TuBYvvJ0Ro6TuqVZBfjLswuis/v+hg545ILoU8lmygykb
        uuQmI3qC6yzJLn7KU8MUS9fugtxxiIxpueU/khClY7hKpUgNOqM6atTfaREyuRTVnT9gyW
        F6uUod1tMLFPGIFdquFKlS9Z8UPiRvVeUYViuw//qCvxVsOvNap7zlXg/XTWrFQ90Pz1Is
        CsdQtNf28caA7LmBo2hE54LW0z9c0N2cUuC2efTM1atTWxOobFi0+H9cWadQsg==
Date:   Wed, 9 Feb 2022 10:12:34 +0200
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <YgN3cq+utQAFFnEW@jyty>
References: <YdLRa86ddm2T4xew@jyty>
 <20220103110743.GA22001@gofer.mess.org>
 <YdLqL2ViSwWzS/Ig@jyty>
 <YdRwqt1pwb8osT6V@jyty>
 <20220105095355.GA6428@gofer.mess.org>
 <YdbVfObDZZnFIDc3@jyty>
 <YeBZmM0ISnFGcsVa@gofer.mess.org>
 <YeEYxwUkCV7rSa0A@jyty>
 <YfV2TeOgSiVShmZN@jyty>
 <YgKeZ+vAynWvvijz@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YgKeZ+vAynWvvijz@gofer.mess.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1644394355; a=rsa-sha256;
        cv=none;
        b=QmACJcnMMYKUu2vSQ4xz53T0+l7Mr5baqv4RqAzI+bZktX8siUFZ/Idv6qXvwqLRoiSuU9
        37k8ewmJBi+ckv0G/RssdOEjkbEGLL87VE86JBJEABegGRtdme0pzHvJard6Ed7RBsY1tC
        8uuyJ+B8Bo7+y6I2zm68iBquton/HkIqL4WNcdYGzSO/FVnQe7LViEDcKillr950YTZaQ7
        BBWqvq9kku1XiIRQyVsRWiG/KFIv2em3uul79PdW7CpTT2dHofm8uMASAFa+sgexVedQQJ
        zkvZk+maEfv/49jDgRCH/2/9rVnsg0EpCLRqCVBb2CdFENixO7rMTZkffol1Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1644394355;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/duAtD7EICn0sGy5Kc7vI8YUIa/Poi/OW9Ae+oD9LYM=;
        b=F1EnFK56iVcR7+kVD68So79PL/wVC9ktMpgJf/d791FC2GAKob/59J8AQLclJvbubUdrgZ
        Ode815ELWcEoZdQcC185CayR8JqR07VIO3/lzU+uA1mR4ThePGjmlYQEDukTFxeDrq2Aqp
        N7EmU8//yy+UhaGuHK+LoSfTVhMchWbxORk1I5GOisrM8JP6oIvuPIIzLXv6d+OwnPgHDg
        NSoBJj/dVsTtkP2+5XnSbn1lbjq6a/yx8nofeGdaHSzaxXzMaTd3Ut+plYku/W5lfu40jJ
        nxoSDmswqDaVTjgggoTf82yHncBLg6fUPe/ML4IuV4z0J9NgcIpVTuPdOiTgqg==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

Tue, Feb 08, 2022 at 04:46:31PM +0000, Sean Young wrote:
>Hi Marko,
>
>On Sat, Jan 29, 2022 at 07:15:57PM +0200, Marko Mäkelä wrote:
>> Hi Sean,
>>
>> Did you have a chance to repeat my findings with a remote control unit that
>> uses the RC5 protocol?
>
>Yes, I've reproduced the problem now. It's very weird.
>
>After pressing button 1, waiting for a second or two, and then pressing button
>3, the device reports some old IR from button 1 before reporting the IR from
>button 3.
>
>The IR is not a copy of old data, it so presumably its IR that was not
>reported before. Now I don't know why this IR gets reported so late.

When I repeated the problem, the delay between subsequent button presses 
could have been even less than a second.

How did you determine that it is not a copy of old data? I assume that 
you can do that fairly easily for any kernel-side buffers, but what 
about the buffer on the USB device itself?

[snip]

>I have not seen this happen. You can enable debugging for this using:
>
>echo 'file rtl28xxu.c +p' > /sys/kernel/debug/dynamic_debug/control
>
>dmesg -w

Thank you. It might take me some time to return to this.

>I do not know exactly how the buffer works, only some experimentation 
>will help here. Unless there is a vendor driver/documentation for this 
>device.

I am just guessing here, since I do not have any experience with USB 
programming, and hardly any experience with the Linux kernel. Could it 
be that the IR samples are being stored in a ring buffer, and the device 
does not implicitly discard IR events as it is sending them to the USB 
host? A simple test could be to read the buffer twice in a row. Will it 
return the same contents, instead of returning nothing on the second 
read?

If my ring buffer hypothesis holds, perhaps the kernel driver should 
keep track on where the data ended on the previous read, re-read the 
device's entire ring buffer, and resume parsing from the previous end of 
the ring buffer? In that way, we should not see phantom old events.

Best regards,

	Marko
