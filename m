Return-Path: <linux-media+bounces-21448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA699CD66D
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 06:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 747CAB23B2A
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 05:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D4317332B;
	Fri, 15 Nov 2024 05:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gzcylA7x"
X-Original-To: linux-media@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303612F26;
	Fri, 15 Nov 2024 05:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731647230; cv=none; b=TuKu/AtVWPJvQKsA1noi5jOjzyHeMrr0ZY645Oc+RcVx+jnka+epvURjWof+rvmYeTK2ur1+AC/+w1T5XAVHnpWV5Ezx1RwIelyAP82Bl9vWfBYf89R85pbbPW8aCyFfgJD7Zkucf5wvf6HDE5gFZsyOnBcvUz4O+4hzN8BOkVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731647230; c=relaxed/simple;
	bh=El/eeZvGnZ8uEhr+u283CTuXNW1Oe+4ae85gYVBx3pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=spxT5uejhsUiYNtMi/MZsh7H2yWGWVtW+0aElGVBAIlHkoQUFJttdgk5zhGT3Pg0LocN320tCr35Z0ZihqfuCTsV2bUQqvuUBKgvKHInQ4UG0kir+AfUoJRCszmmqbm83BZUz/JWKRjQt/eEWbYyqZ4A4YmRQi01UV9fei8Ox9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gzcylA7x; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=N9aQtAImZopfyOv5zhJRxixkotiB87MZ1qMsusX6hHY=; b=gzcylA7x8RRn1kEXLhYmuvlIUy
	qtmfBWH4oWgA2sfHuSo1u+A1KVsb2B5zLI/BkHHCXr7eM8ISH42udL2D1bTXVrL5Bz1urkBkHzfMQ
	eH2WWLmhyQoQDmOK9nJcWItGq5615qcRnQbwQYwD7g5/EzSG69Zhid/CASyBVvvB/7T26KfSySASJ
	9YsO2QjsQ5x24SF3bihpWkpI/OOuzhyYgMbbqkWbmK0ZpUvszX4wxPzlFWy1SEdlRt4zPyqIwuMRZ
	gN/N9vvcvdP3ExvBuXetxClAYIXPCEQzDVO5CZ7gUkF65+ZmodUWCBD15sIra50WuPPISemIyfX17
	D2fLzWvQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tBoXs-00000000tQv-2UVa;
	Fri, 15 Nov 2024 05:07:00 +0000
Message-ID: <5dbe1671-e5bd-44e1-b2cf-21ad30339024@infradead.org>
Date: Thu, 14 Nov 2024 21:06:54 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: Add debugging section to process
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, kernel@collabora.com, bob.beckett@collabora.com,
 nicolas.dufresne@collabora.com
References: <20241028-media_docs_improve_v3-v2-0-f1960ae22c5d@collabora.com>
 <20241028-media_docs_improve_v3-v2-1-f1960ae22c5d@collabora.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241028-media_docs_improve_v3-v2-1-f1960ae22c5d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/13/24 3:17 AM, Sebastian Fricke wrote:
> This idea was formed after noticing that new developers experience
> certain difficulty to navigate within the multitude of different
> debugging options in the Kernel and while there often is good
> documentation for the tools, the developer has to know first that they
> exist and where to find them.
> Add a general debugging section to the Kernel documentation, as an
> easily locatable entry point to other documentation and as a general
> guideline for the topic.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
>  .../driver_development_debugging_guide.rst         | 214 ++++++++++++++++
>  Documentation/process/debugging/index.rst          |  65 +++++
>  .../debugging/userspace_debugging_guide.rst        | 278 +++++++++++++++++++++
>  Documentation/process/index.rst                    |   8 +-
>  4 files changed, 562 insertions(+), 3 deletions(-)
> 


> diff --git a/Documentation/process/debugging/userspace_debugging_guide.rst b/Documentation/process/debugging/userspace_debugging_guide.rst
> new file mode 100644
> index 000000000000..a7c94407bcae
> --- /dev/null
> +++ b/Documentation/process/debugging/userspace_debugging_guide.rst
> @@ -0,0 +1,278 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +==========================
> +Userspace debugging advice
> +==========================
> +
> +A brief overview of common tools to debug the Linux Kernel from userspace.

Make that a sentence?

> +For debugging advice aimed at driver developer go :doc:`here
> +</process/debugging/driver_development_debugging_guide>`.
> +For general debugging advice, see :doc:`general advice document
> +</process/debugging/index>`.
> +
> +.. contents::
> +    :depth: 3
> +
> +The following sections show you the available tools.
> +
> +Dynamic debug
> +-------------
> +
> +Mechanism to filter what ends up in the kernel log by dis-/en-abling log
> +messages.
> +
> +Prerequisite: ``CONFIG_DYNAMIC_DEBUG``
> +
> +Dynamic debug is only able to target:
> +
> +- pr_debug()
> +- dev_dbg()
> +- print_hex_dump_debug()
> +- print_hex_dump_bytes()
> +
> +Therefore the usability of this tool is, as of now, quite limited as there is
> +no uniform rule for adding debug prints to the codebase, resulting in a variety
> +of ways these prints are implemented.
> +
> +Also, note that most debug statements are implemented as a variation of
> +dprintk(), which have to be activated via a parameter in respective module,

                                                         in the respective module;

> +dynamic debug is unable to do that step for you.
> +
> +Here is one example, that enables all available pr_debug() 's within the file::

                                                    no space ^

> +
> +  $ alias ddcmd='echo $* > /proc/dynamic_debug/control'
> +  $ ddcmd '-p; file v4l2-h264.c +p'
> +  $ grep =p /proc/dynamic_debug/control
> +   drivers/media/v4l2-core/v4l2-h264.c:372 [v4l2_h264]print_ref_list_b =p
> +   "ref_pic_list_b%u (cur_poc %u%c) %s"
> +   drivers/media/v4l2-core/v4l2-h264.c:333 [v4l2_h264]print_ref_list_p =p
> +   "ref_pic_list_p (cur_poc %u%c) %s\n"
> +
> +**When should you use this over Ftrace ?**
> +
> +- When the code contains one of the valid print statements (see above) or when
> +  you have added multiple pr_debug() statements during development
> +- When timing is not an issue, meaning if multiple pr_debug() statements in
> +  the code won't cause delays
> +- When you care more about receiving specific log messages than tracing the
> +  pattern of how a function is called
> +
> +For the full documentation see :doc:`/admin-guide/dynamic-debug-howto`
> +
> +Ftrace
> +------
> +
> +Prerequisite: ``CONFIG_DYNAMIC_FTRACE``
> +
> +This tool uses the tracefs file system for the control files and output files,

                                                                           files.

> +that file system will be mounted as a ``tracing`` folder, which can be found in

   That

> +either ``/sys/kernel/`` or ``/sys/debug/kernel/``.
> +
> +Some of the most important operations for debugging are:
> +
> +- You can perform a function trace by adding a function name to the
> +  ``set_ftrace_filter`` file (which accepts any function name found within the
> +  ``available_filter_functions`` file) or you can specifically disable certain
> +  functions by adding their names to the ``set_ftrace_notrace`` file (More info

                                                                         more

> +  at: :ref:`trace/ftrace:dynamic ftrace`).
> +- In order to find out where the calls originates from you can activate the

                          where calls originate from

> +  ``func_stack_trace`` option under ``options/func_stack_trace``.
> +- Tracing the children of a function call and showing the return values is

                                                                           are

> +  possible by adding the desired function in the ``set_graph_function`` file
> +  (requires config ``FUNCTION_GRAPH_RETVAL``) more info at

                                               );

> +  :ref:`trace/ftrace:dynamic ftrace with the function graph tracer`.
> +
> +For the full Ftrace documentation see :doc:`/trace/ftrace`
> +
> +Or you could also trace for specific events by :ref:`using event tracing
> +<trace/events:2. using event tracing>`, which can be defined as described here:
> +:ref:`Creating a custom Ftrace tracepoint
> +<process/debugging/driver_development_debugging_guide:ftrace>`.
> +
> +For the full Ftrace event tracing documentation see :doc:`/trace/events`
> +
> +.. _read_ftrace_log:
> +
> +Reading the ftrace log
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +The ``trace`` file can be read just like any other file (``cat``, ``tail``, ``head``,
> +``vim``, etc.), the size of the file is limited by the ``buffer_size_kb`` (``echo
> +1000 > buffer_size_kb``). The :ref:`trace/ftrace:trace_pipe` will behave
> +similar to the ``trace`` file, but whenever you read from the file the content is

   similarly
IMO but not a big deal.

> +consumed.
> +
> +Kernelshark
> +~~~~~~~~~~~
> +
> +A GUI interface to visualize the traces as a graph and list view from the
> +output of the `trace-cmd
> +<https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/>`__ application.
> +
> +For the full documentation see `<https://kernelshark.org/Documentation.html>`__
> +
> +Perf & alternatives
> +-------------------
> +
> +The tools mentioned above provide ways to inspect kernel code, results, variable values, etc.
> +Sometimes you have to find out first where to look and for those cases, a box of
> +performance tracking tools can help you to frame the issue.
> +
> +Why should you do a performance analysis?
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +A performance analysis is a good first step when among other reasons:
> +
> +- you cannot define the issue
> +- you do not know where it occurs
> +- the running system should not be interrupted or it is a remote system, where
> +  you cannot install a new module/kernel
> +
> +How to do a simple analysis with linux tools?

                                    Linux

> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +For the start of a performance analysis, you can start with the usual tools
> +like:
> +
> +- ``top`` / ``htop`` / ``atop`` (*get an overview of the system load, see spikes on
> +  specific processes*)
> +- ``mpstat -P ALL`` (*look at the load distribution among CPUs*)
> +- ``iostat -x`` (*observe input and output devices utilization and performance*)
> +- ``vmstat`` (*overview of memory usage on the system*)
> +- ``pidstat`` (*similar to* ``vmstat`` *but per process, to dial it down to the
> +  target*)
> +- ``strace -tp $PID`` (*once you know the process, you can figure out how it
> +  communicates with the Kernel*)
> +
> +These should help to narrow down the areas to look at sufficiently.
> +
> +Diving deeper with perf
> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The **perf** tool provides a series of metrics and events to further dial down
> +on issues.
> +
> +Prerequisite: build or install perf on your system
> +
> +Gather statistics data for finding all files starting with ``gcc`` in ``/usr``::
> +
> +  # perf stat -d find /usr -name 'gcc*' | wc -l
> +
> +   Performance counter stats for 'find /usr -name gcc*':
> +
> +     1277.81 msec    task-clock             #    0.997 CPUs utilized
> +     9               context-switches       #    7.043 /sec
> +     1               cpu-migrations         #    0.783 /sec
> +     704             page-faults            #  550.943 /sec
> +     766548897       cycles                 #    0.600 GHz                         (97.15%)
> +     798285467       instructions           #    1.04  insn per cycle              (97.15%)
> +     57582731        branches               #   45.064 M/sec                       (2.85%)
> +     3842573         branch-misses          #    6.67% of all branches             (97.15%)
> +     281616097       L1-dcache-loads        #  220.390 M/sec                       (97.15%)
> +     4220975         L1-dcache-load-misses  #    1.50% of all L1-dcache accesses   (97.15%)
> +     <not supported> LLC-loads
> +     <not supported> LLC-load-misses
> +
> +   1.281746009 seconds time elapsed
> +
> +   0.508796000 seconds user
> +   0.773209000 seconds sys
> +
> +
> +  52
> +
> +The availability of events and metrics depends on the system you are running.
> +
> +For the full documentation see
> +`<https://perf.wiki.kernel.org/index.php/Main_Page>`__
> +
> +Perfetto
> +~~~~~~~~
> +
> +A set of tools to measure and analyze how well applications and systems perform.
> +You can use it to:
> +
> +* identify bottlenecks
> +* optimize code
> +* make software run faster and more efficiently.
> +
> +**What is the difference between perfetto and perf?**
> +
> +* perf is tool as part of and specialized for the Linux Kernel and has CLI user
> +  interface.
> +* perfetto cross-platform performance analysis stack, has extended
> +  functionality into userspace and provides a WEB user interface.
> +
> +For the full documentation see `<https://perfetto.dev/docs/>`__

config PSI
	bool "Pressure stall information tracking"
might also be useful here.

> +
> +Kernel panic analysis tools
> +---------------------------
> +
> +  To capture the crash dump please use ``Kdump`` & ``Kexec``. Below you can find
> +  some advice for analysing the data.
> +
> +  For the full documentation see the :doc:`/admin-guide/kdump/kdump`
> +
> +  In order to find the corresponding line in the code you can use `faddr2line
> +  <https://elixir.bootlin.com/linux/v6.11.6/source/scripts/faddr2line>`__, note

                                                                            ; note

> +  that you need to enable ``CONFIG_DEBUG_INFO`` for that to work.
> +
> +  An alternative to using ``faddr2line`` is the use of ``objdump`` (and it's

                                                                           its

> +  derivatives for the different platforms like ``aarch64-linux-gnu-objdump``),

                                                                               ).

> +  take this line as an example:

     Take

> +
> +  ``[  +0.000240]  rkvdec_device_run+0x50/0x138 [rockchip_vdec]``.
> +
> +  We can find the corresponding line of code by executing::
> +
> +    aarch64-linux-gnu-objdump -dS drivers/staging/media/rkvdec/rockchip-vdec.ko | grep rkvdec_device_run\>: -A 40
> +    0000000000000ac8 <rkvdec_device_run>:
> +     ac8:	d503201f 	nop
> +     acc:	d503201f 	nop
> +    {
> +     ad0:	d503233f 	paciasp
> +     ad4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
> +     ad8:	910003fd 	mov	x29, sp
> +     adc:	a90153f3 	stp	x19, x20, [sp, #16]
> +     ae0:	a9025bf5 	stp	x21, x22, [sp, #32]
> +        const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> +     ae4:	f9411814 	ldr	x20, [x0, #560]
> +        struct rkvdec_dev *rkvdec = ctx->dev;
> +     ae8:	f9418015 	ldr	x21, [x0, #768]
> +        if (WARN_ON(!desc))
> +     aec:	b4000654 	cbz	x20, bb4 <rkvdec_device_run+0xec>
> +        ret = pm_runtime_resume_and_get(rkvdec->dev);
> +     af0:	f943d2b6 	ldr	x22, [x21, #1952]
> +        ret = __pm_runtime_resume(dev, RPM_GET_PUT);
> +     af4:	aa0003f3 	mov	x19, x0
> +     af8:	52800081 	mov	w1, #0x4                   	// #4
> +     afc:	aa1603e0 	mov	x0, x22
> +     b00:	94000000 	bl	0 <__pm_runtime_resume>
> +        if (ret < 0) {
> +     b04:	37f80340 	tbnz	w0, #31, b6c <rkvdec_device_run+0xa4>
> +        dev_warn(rkvdec->dev, "Not good\n");
> +     b08:	f943d2a0 	ldr	x0, [x21, #1952]
> +     b0c:	90000001 	adrp	x1, 0 <rkvdec_try_ctrl-0x8>
> +     b10:	91000021 	add	x1, x1, #0x0
> +     b14:	94000000 	bl	0 <_dev_warn>
> +        *bad = 1;
> +     b18:	d2800001 	mov	x1, #0x0                   	// #0
> +     ...
> +
> +  Meaning, in this line from the crash dump::
> +
> +    [  +0.000240]  rkvdec_device_run+0x50/0x138 [rockchip_vdec]
> +
> +  I can take the ``0x50`` as offset, which I have to add to the base address
> +  of the corresponding function, which I find in this line::
> +
> +    0000000000000ac8 <rkvdec_device_run>:
> +
> +  The result of ``0xac8 + 0x50 = 0xb18``
> +  And when I search for that address within the function I get the
> +  following line::
> +
> +    *bad = 1;
> +    b18:      d2800001        mov     x1, #0x0
> +
> +**Copyright** ©2024 : Collabora
> diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
> index 6455eba3ef0c..aa12f2660194 100644
> --- a/Documentation/process/index.rst
> +++ b/Documentation/process/index.rst
> @@ -72,13 +72,15 @@ beyond).
>  Dealing with bugs
>  -----------------
>  
> -Bugs are a fact of life; it is important that we handle them properly.
> -The documents below describe our policies around the handling of a couple
> -of special classes of bugs: regressions and security problems.
> +Bugs are a fact of life; it is important that we handle them properly. The
> +documents below provide general advice about debugging and describe our
> +policies around the handling of a couple of special classes of bugs:
> +regressions and security problems.
>  
>  .. toctree::
>     :maxdepth: 1
>  
> +   debugging/index
>     handling-regressions
>     security-bugs
>     cve
> 

Thanks.

-- 
~Randy


