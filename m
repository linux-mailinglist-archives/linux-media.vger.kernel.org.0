Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50574195E8F
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 20:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbgC0TXt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 15:23:49 -0400
Received: from mail-qv1-f43.google.com ([209.85.219.43]:44988 "EHLO
        mail-qv1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgC0TXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 15:23:49 -0400
Received: by mail-qv1-f43.google.com with SMTP id ef12so3441104qvb.11
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2020 12:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=COviC50TfGFFke5Tw6FIl+KemNZ2/egDJog7vCaVKUc=;
        b=ifzMe/TuudRoT+CFnffxuSXE2Abyfs+hlyv0moEMOcYdzds403xarRvKXiosRnVVUW
         cHQV1q2q9J6Ih8sOHnW8i2gOqTFGgz1me1wElaIvL57TMxhxSbaEyWtLMaZ4QVg85N6O
         +0kG/Gh9VNv4iem9CkUBGXiwRjyjKcMe1BhM9x316RjEv2id5XQwocQpsscHnHvX1BsD
         LaifObIHNcAbI4v6RqL6nYWtKx1qBkqQSXSp6tiMsXPQoNwqv7DMrBcDQUNbUDJ8dxxr
         vDWUMQDrT3fcyL7gWf+fN7nHBlFyA6aFyjweN7ACY3Dczcb2ekoWVhVMGxt0BrbWhOfd
         qO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=COviC50TfGFFke5Tw6FIl+KemNZ2/egDJog7vCaVKUc=;
        b=KiRMKjjmOdlRZODsX4/r8MMiJzsdZMywgCsMOZAWWmJJBr/ssk5QynhZOG4EhJyumW
         jvRiGu8uJubdMH9uRC92CRJxHqzGLWCqd53xnwZdx9bAocwYZpdTvX9bBg3THk0XnpbK
         gBM2zzJ0USS0NW8D0rgvGWH61B90/fEgPP6nCof9mS+SossYg15/tJQxhzD1xp4O7LJl
         ZKyG1daoU1xFpWDFGAygbqUvUbau4df6FybOYtT5y7rym3H2kRIQf6nxQOzLefVtNRAk
         1ACcy6IvmfgVFTm5gUdKRydw3LVenp46ISAEes9u5R7Kats0Av9mQCc1EPzggWAZawr1
         biiA==
X-Gm-Message-State: ANhLgQ1XUlgAREnuqF1sWOvJM1CCco7cuvnuNRh8g10JeRTQeGHB0c0x
        7jAPhYJvybD1Rhe0B/wnhrc=
X-Google-Smtp-Source: ADFU+vvB8n8teTUhyOxLQ5F4QwAhqD54gntwJlHjoh4LT77Qg5Xn8TJ5o0ewobiCpjyCQe2jZREXzQ==
X-Received: by 2002:a0c:f709:: with SMTP id w9mr789932qvn.159.1585337027703;
        Fri, 27 Mar 2020 12:23:47 -0700 (PDT)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac? ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id u13sm4252326qku.92.2020.03.27.12.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 12:23:47 -0700 (PDT)
Subject: Re: [RFC, WIP, v2 3/3] media: dvb_dummy_fe.c: write PSI information
 into DMX buffer
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     sean@mess.org, kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20200323125732.281976-1-dwlsalmeida@gmail.com>
 <20200323125732.281976-4-dwlsalmeida@gmail.com>
 <20200327174740.5d5935ae@coco.lan>
 <a4066f72-ae83-c1ef-8bf7-d4bbcfa29b31@gmail.com>
Message-ID: <3c072783-59f4-ba0f-6634-978ca0e6ae49@gmail.com>
Date:   Fri, 27 Mar 2020 16:23:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a4066f72-ae83-c1ef-8bf7-d4bbcfa29b31@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, as always, thank you for reviewing my code!


Sorry for making you repeat yourself on the alignment of arguments and 
on multi-line comment syntax, I am aware of these and I thought I had 
fixed them all, but some just slip by sometimes.


 > As we talked via IRC in priv, the best would be to implement the MPEG_TS
 > generator as part of the bridge DVB driver.
 >
 > Anyway, I will review the code below assuming that you'll be moving the
 > implementation to the right place.

Yes. Please let me know when the changes in experimental/media-kconfig 
land, since I'd like to rename and move all the code - including the 
bridge I have been working on - to test_drivers/vidtv.


 > +static void dvb_dummy_fe_thread_mpeg_ts_tick(struct dvb_frontend *fe)
 > +{
 > +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
 > +	const unsigned int SLEEP_MSECS = 10;
 > +	u32 ticks = 0;
 > +	u32 i;
 > +	char *buf = kzalloc(DMX_BUF_LEN, GFP_KERNEL);
 > +	u32 buffer_offset;
 > +
 > +	struct dvb_dummy_table_pat pat = {0};
 > +	struct dvb_dummy_table_sdt sdt = {0};
 > I guess it is ok here, but allocating too much stuff at the stack is
 > dangerous. Linux Kernel stack is very small. Perhaps the best would
 > be to place those at the driver's private struct (with is allocated with
 > kalloc).
 >
Well, I wasn't aware of that, but most of the data for these tables are 
heap-allocated. How small are we talking about?

But your suggestion is OK with me as well. It would be even better if 
this entire function wasn't in this patch at all, since it will have to 
be moved to the bridge driver anyways.

The *_write_args structures are also pretty small.

 >> +
 >> +	struct dvb_dummy_table_pmt *pmt_sections;
 >> +
 >> +	struct dvb_dummy_table_pat_program *programs = NULL;
 >> +	struct dvb_dummy_table_sdt_service *services = NULL;
 >> +
 >> +	bool update_version_num = false;
 >> +	u16 pmt_pid;
 >> +
 >> +	programs = dummy_fe_pat_prog_cat_into_new(state->channels);
 >> +	services = dummy_fe_sdt_serv_cat_into_new(state->channels);
 >> +
 >> +	/* assemble all programs and assign to PAT */
 >> +	dummy_fe_pat_program_assign(&pat, programs);
 >> +
 >> +	/* assemble all services and assign to SDT */
 >> +	dummy_fe_sdt_service_assign(&sdt, services);
 >> +
 >> +	/* a section for each program_id */
 >> +	pmt_sections = kcalloc(pat.programs,
 >> +			       sizeof(struct dvb_dummy_table_pmt),
 >> +			       GFP_KERNEL);
 >> +
 >> +	dummy_fe_pmt_create_section_for_each_pat_entry(&pat,
 >> +						       pmt_sections);
 >> +
 >> +	dummy_fe_pmt_stream_match_with_sections(state->channels,
 >> +						pmt_sections,
 >> +						pat.programs);
 >> +
 >> +	dummy_fe_pat_table_init(&pat,
 >> +				update_version_num,
 >> +				TRANSPORT_STREAM_ID);
 >> +
 >> +	dummy_fe_sdt_table_init(&sdt,
 >> +				update_version_num,
 >> +				TRANSPORT_STREAM_ID);
 >> +	while (true) {
 >> +		memset(buf, 0, DMX_BUF_LEN);
 >> +		buffer_offset = 0;
 >> +
 >> +		if ((ticks % 50) == 0) {
 >> +			/* push PSI packets into the buffer */
 >> +
 >> +			buffer_offset +=
 >> +				dummy_fe_pat_write_into(buf,
 >> +							buffer_offset,
 >> +							&pat);
 >> +			for (i = 0; i < pat.programs; ++i) {
 >> +				pmt_pid =
 >> +				dummy_fe_pmt_get_pid(&pmt_sections[i],
 >> +						     &pat);
 >> +
 >> +				/* not found */
 >> +				WARN_ON(pmt_pid > LAST_VALID_TS_PID);
 >> +
 >> +				/* write each section into buffer */
 >> +				buffer_offset +=
 >> +				dummy_fe_pmt_write_into(buf,
 >> +							buffer_offset,
 >> +							&pmt_sections[i],
 >> +							pmt_pid);
 >> +			}
 >> +
 >> +			buffer_offset +=
 >> +				dummy_fe_sdt_write_into(buf,
 >> +							buffer_offset,
 >> +							&sdt);
 >> +
 >> +			WARN_ON(buffer_offset > DMX_BUF_LEN); /* overflow */
 >> +			msleep_interruptible(SLEEP_MSECS);
 > That doesn't sound right, for two reasons:
 >
 > 1) msleep_interruptible() can take less time than expected, if
 >    interupted;
 > 2) the time may vary a lot.
 >
 > I would use the high-res timer here, giving a range for it (maybe a 10ms
 > range?), e. g., something like:
 >
 > 			usleep_range(SLEEP_USECS, SLEEP_USECS + 10000);
 >
 >
 >
OK. I wonder if this will have to be rewritten in the future, since 
decoders will probably expect X amount of video/audio per Y amount of time?


As for buffer overflows, maybe a better strategy would be to use a 
dynamic array? I would wrap all memcpy() calls and call krealloc() as 
necessary. If we go with a big enough initial size (say, 20 TS packets) 
then this wouldn't happen very often, if at all. That would be a simple 
solution to completely eliminate this problem, in my opinion.


I don't know if there's a limit on how much data you can pass to the 
demux at once, but if there is, we can just split the buffer into 
smaller chunks when calling dmx_swfilter_packets(), since the amount of 
bytes actually present in the buffer will be a multiple of 188 anyways.


 > +	}
 > +
 > +	length += CRC_SIZE_IN_BYTES;
 > +
 > +	WARN_ON(length > SDT_MAX_SECTION_LEN);
 > even assuming that you fix the above code, and update "s" to the next
 > SDT data, this is still too dangerous: if are there any risk of going
 > past the buffer size, you should check *before* the bad condition 
happens,
 > e. g., something like:
 >
 > 	while (s && length + CRC_SIZE_IN_BYTES < SDT_MAX_SECTION_LEN) {
 > 		...
 > 	}
 >
 > 	if (s)
 > 		WARN_ON(length > SDT_MAX_SECTION_LEN);
 >
 >> +	return length;
 >> +}
 >> +

My understanding is that, e.g.

length > SDT_MAX_SECTION_LEN

doesn't mean that the buffer will necessarily overflow. It is just 
against the spec.


Best regards

- Daniel.
