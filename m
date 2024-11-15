Return-Path: <linux-media+bounces-21447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1899CD64B
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 05:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AE171F22597
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 04:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD22017332B;
	Fri, 15 Nov 2024 04:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="P7+11m27"
X-Original-To: linux-media@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19233BB22;
	Fri, 15 Nov 2024 04:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731646388; cv=none; b=eL0SJel8RPlH46q8rEDZBPCAeAn9dXEZXcSvpQqVB8QFIpysOY494VPZaLvTdVyY2cHXamo+t/54KtPURstB/kCwAYomAegtiSgq59uZwzf5ip/nd2bxp3/E+5ffDqGKqEzp5bgn+6GWujV73ykR6L1Z6gH6yCafeg/NeApJ2Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731646388; c=relaxed/simple;
	bh=ihrsHBw7yOTUqo2UY6bWt9wDXVyfZGjpBezAgn/sMVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c97eMl0B5v+DcQlmHjqW05P6KQvbCwJv6fIoc9ORSod3nT6VGPtE3ey4qbOGzN4e9OyJ1YtVRxbc7XGT3Uaqs4xS9PnypY2rg43JqDtAUBcLLWXWQaKVZMI8CkP4cROI+r9E5AEimOOQbYWKLCotmWd89sy+QEZtklKzz2t0oOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=P7+11m27; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=pZvuIZYX1mjibbaXZuFto3la6Odd9vx4i5BPmwGnbl4=; b=P7+11m27J1BVB+ejQ4PkjwzcVr
	2Tm7JAnHcNQhgrf6uyVlQKl7to5WQJ5rvKHWAFBy/kKyx8ZOM3qAE5N8YNbgTb3HF3ppHtx+85tBz
	vUOKKVV/cBVTCmV23RKSpW5mhjIiwncpHf1h3x6mDcICV24Li9uWkY5IhbsVnnsUxFL/43NESvt9k
	8um0+Mp3ipPD24H96TJ/7GYhCVw2vckwQknIhOSYHf5LzKlTvgJBqcer3OGPQcG7jFMeR8E9+QhRM
	HLhyu6vj+wHs4KL6xqd6nnftyZjC4MfHn1OoKqMTRawRO9W/DOv915XrFBbWiyIL2duQ9rSPKt37W
	oC9tbJGQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tBoK9-00000000rpg-4AID;
	Fri, 15 Nov 2024 04:52:49 +0000
Message-ID: <0377df86-55f8-41bf-9f12-55b04e50c43d@infradead.org>
Date: Thu, 14 Nov 2024 20:52:44 -0800
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
> diff --git a/Documentation/process/debugging/driver_development_debugging_guide.rst b/Documentation/process/debugging/driver_development_debugging_guide.rst
> new file mode 100644
> index 000000000000..bfeefb242b03
> --- /dev/null
> +++ b/Documentation/process/debugging/driver_development_debugging_guide.rst
> @@ -0,0 +1,214 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +========================================
> +Debugging advice for driver development
> +========================================
> +
> +This document serves as a general starting point and lookup for debugging device
> +drivers.
> +While this guide focuses on debugging that requires re-compiling the
> +module/kernel, the :doc:`userspace debugging guide
> +</process/debugging/userspace_debugging_guide>` will guide
> +you through tools like dynamic debug, ftrace and other tools useful for
> +debugging issues and behavior.
> +For general debugging advice, see the :doc:`general advice document
> +</process/debugging/index>`.
> +
> +.. contents::
> +    :depth: 3
> +
> +The following sections show you the available tools.
> +
> +printk() & friends
> +------------------
> +
> +These are derivatives of printf() with varying destinations and support for
> +being dynamically turned on or off, or lack thereof.
> +
> +Simple printk()
> +~~~~~~~~~~~~~~~
> +
> +The classic, can be used to great effect for quick and dirty development
> +of new modules or to extract arbitrary necessary data for troubleshooting.
> +
> +Prerequisite: ``CONFIG_PRINTK`` (usually enabled by default)
> +
> +**Pros**:
> +
> +- No need to learn anything, simple to use
> +- Easy to modify exactly to your needs (formatting of the data (See:
> +  :doc:`/core-api/printk-formats`), visibility in the log)
> +- Can cause delays in the execution of the code (beneficial to confirm whether
> +  timing is a factor)
> +
> +**Cons**:
> +
> +- Requires rebuilding the kernel/module
> +- Can cause delays in the execution of the code (which can cause issues to be
> +  not reproducible)
> +
> +For the full documentation see :doc:`/core-api/printk-basics`
> +
> +Trace_printk
> +~~~~~~~~~~~~
> +
> +Prerequisite: ``CONFIG_DYNAMIC_FTRACE`` & ``#include <linux/ftrace.h>``
> +
> +It is a tiny bit less comfortable to use than printk(), because you will have
> +to read the messages from the trace file (See: :ref:`read_ftrace_log`
> +instead of from the kernel log, but very useful when printk() adds unwanted
> +delays into the code execution, causing issues to be flaky or hidden.)
> +
> +If the processing of this still causes timing issues then you can try
> +trace_puts().
> +
> +For the full Documentation see trace_printk()
> +
> +dev_dbg
> +~~~~~~~
> +
> +Print statement, which can be targeted by
> +:ref:`process/debugging/userspace_debugging_guide:dynamic debug` that contains
> +additional information about the device used within the context.
> +
> +**When is it appropriate to leave a debug print in the code?**
> +
> +Permanent debug statements have to be useful for a developer to troubleshoot
> +driver misbehavior. Judging that is a bit more of an art than a science, but
> +some guidelines are in the :ref:`Coding style guidelines
> +<process/coding-style:13) printing kernel messages>`. In almost all cases the
> +debug statements shouldn't be upstreamed, as a working driver is supposed to be
> +silent.
> +
> +Custom printk
> +~~~~~~~~~~~~~
> +
> +Example::
> +
> +  #define core_dbg(fmt, arg...) do { \
> +	  if (core_debug) \
> +		  printk(KERN_DEBUG pr_fmt("core: " fmt), ## arg); \
> +	  } while (0)
> +
> +**When should you do this?**
> +
> +It is better to just use a pr_debug(), which can later be turned on/off with
> +dynamic debug. Additionally, a lot of drivers activate these prints via a
> +variable like ``core_debug`` set by a module parameter. However, Module
> +parameters `are not recommended anymore
> +<https://lore.kernel.org/all/2024032757-surcharge-grime-d3dd@gregkh>`_.
> +
> +Ftrace
> +------
> +
> +Creating a custom Ftrace tracepoint
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +A tracepoint adds a hook into your code that will be called and logged when the
> +tracepoint is enabled. This can be used, for example, to trace hitting a
> +conditional branch or to dump the internal state at specific points of the code
> +flow during a debugging session.
> +
> +Here is a basic description of :ref:`how to implement new tracepoints
> +<trace/tracepoints:usage>`.
> +
> +For the full event tracing documentation see :doc:`/trace/events`
> +
> +For the full Ftrace documentation see :doc:`/trace/ftrace`
> +
> +DebugFS
> +-------
> +
> +Prerequisite: ``CONFIG_DEBUG_FS` & `#include <linux/debugfs.h>``
> +
> +DebugFS differs from the other approaches of debugging, as it doesn't write
> +messages to the kernel log nor add traces to the code. Instead it allows the
> +developer to handle a set of files.
> +With these files you can either store values of variables or make
> +register/memory dumps or you can make these files writable and modify
> +values/settings in the driver.
> +
> +Possible use-cases among others:
> +
> +- Store register values
> +- Keep track of variables
> +- Store errors
> +- Store settings
> +- Toggle a setting like debug on/off
> +- Error injection
> +
> +This is especially useful, when the size of a data dump would be hard to digest
> +as part of the general kernel log (for example when dumping raw bitstream data)
> +or when you are not interested in all the values all the time, but with the
> +possibility to inspect them.
> +
> +The general idea is:
> +
> +- Create a directory during probe (``struct dentry *parent =
> +  debugfs_create_dir("my_driver", NULL);``)
> +- Create a file (``debugfs_create_u32("my_value", 444, parent, &my_variable);``)
> +
> +  - In this example the file is found in ``/sys/kernel/debug/my_driver/my_value``
> +    (with read permissions for user/group/all)
> +  - any read of the file will return the current contents of the variable
> +    ``my_variable``
> +
> +- Clean up the folder when removing the device
> +  (``debugfs_remove_recursive(parent);``)
> +
> +For the full documentation see :doc:`/filesystems/debugfs`.
> +
> +KASAN, UBSAN, lockdep and other error checkers
> +----------------------------------------------
> +
> +KASAN (Kernel Address Sanitizer)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Prerequisite: ``CONFIG_KASAN``
> +
> +KASAN is a dynamic memory error detector that helps to find use-after-free and
> +out-of-bounds bugs. It uses compile-time instrumentation to check every memory
> +access.
> +
> +For the full documentation see :doc:`/dev-tools/kasan`.
> +
> +UBSAN (Undefined Behavior Sanitizer)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Prerequisite: ``CONFIG_UBSAN``
> +
> +UBSAN relies on compiler instrumentation and runtime checks to detect undefined
> +behavior. It is designed to find a variety of issues, including signed integer
> +overflow, array index out of bounds, and more.
> +
> +For the full documentation see :doc:`/dev-tools/ubsan`
> +
> +lockdep (Lock Dependency Validator)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Prerequisite: ``CONFIG_DEBUG_LOCKDEP``
> +
> +lockdep is a runtime lock dependency validator that detects potential deadlocks
> +and other locking-related issues in the kernel.
> +It tracks lock acquisitions and releases, building a dependency graph that is
> +analyzed for potential deadlocks.
> +lockdep is especially useful for validating the correctness of lock ordering in
> +the kernel.
> +
> +device coredump
> +---------------
> +
> +Prerequisite: ``#include <linux/devcoredump.h>``
> +
> +Provides the infrastructure for a driver to provide arbitrary data to userland.
> +It is most often used in conjunction with udev or similar userland application
> +to listen for kernel uevents, which indicate that the dump is ready. Udev has
> +rules to copy that file somewhere for long-term storage and analysis, as by
> +default, the data for the dump is automatically cleaned up after 5 minutes.
> +That data is analyzed with driver-specific tools or GDB.
> +
> +You can find an example implementation at:
> +`drivers/media/platform/qcom/venus/core.c
> +<https://elixir.bootlin.com/linux/v6.11.6/source/drivers/media/platform/qcom/venus/core.c#L30>`__
> +
> +**Copyright** ©2024 : Collabora
> diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
> new file mode 100644
> index 000000000000..77ec17d1c119
> --- /dev/null
> +++ b/Documentation/process/debugging/index.rst
> @@ -0,0 +1,65 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +============================================
> +Debugging advice for Linux Kernel developers
> +============================================
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   driver_development_debugging_guide
> +   userspace_debugging_guide
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`
> +
> +General debugging advice
> +========================
> +
> +Depending on the issue, a different set of tools is available to track down the
> +problem or even to realize whether there is one in the first place.
> +
> +As a first step you have to figure out what kind of issue you want to debug.
> +Depending on the answer, your methodology and choice of tools may vary.
> +
> +Do I need to debug with limited access?
> +---------------------------------------
> +
> +Do you have limited access to the machine or are you unable to stop the running
> +execution?
> +
> +In this case your debugging capability depends on built-in debugging support of
> +provided distro kernel.

preferable s/distro/distribution/

> +The :doc:`/process/debugging/userspace_debugging_guide` provides a brief
> +overview over range of possible debugging tools in that situation. You can

            over {a | the} range

> +check the capability of your kernel, in most cases, by looking into config file
> +within the /boot folder.
> +
> +Do I have root access to the system?
> +------------------------------------
> +
> +Are you easily able to replace the module in question or to install a new
> +kernel?
> +
> +In that case your range of available tools is a lot bigger, you can find the
> +tools in the :doc:`/process/debugging/driver_development_debugging_guide`.
> +
> +Is timing a factor?
> +-------------------
> +
> +It is important to understand if the problem you want to debug manifests itself
> +consistently (i.e. given a set of inputs you always get the same, incorrect
> +output), or inconsistently. If it manifests itself inconsistently, some timing
> +factor might be at play. If inserting delays into the code does change the
> +behavior, then quite likely timing is a factor.
> +
> +When timing does alter the outcome of the code execution using a simple
> +printk() for debugging purposes may not work, a similar alternative is to use

                                           work. A

> +trace_printk() , which logs the debug messages to the trace file instead of the
> +kernel log.
> +
> +**Copyright** ©2024 : Collabora

[userspace guide reviewed separately]


I see 3 uses of "folder" here. Directory or sub-directory is much preferred IMO.

Thanks.
-- 
~Randy


