Return-Path: <linux-media+bounces-21110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AC49C1792
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC912B21D0A
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 08:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827E31D3625;
	Fri,  8 Nov 2024 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="ZYbi0CZP"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61957DA95;
	Fri,  8 Nov 2024 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731053621; cv=pass; b=eRraYuMqw7wPvUPDGL58SPFgGoas6Ij4IgsfvcyvuMX/7LSKMf55KqHhLEeAF9iQhcOXfNcKE5UutnURyghW46Ti9bqS4SWiSf94V5vL8AjfrhhVv7IJ4lAMCr+O7w1ydutds7p1Y6i1DLW0ZkwwS3TJivw7YKXwhCc3KPOrTBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731053621; c=relaxed/simple;
	bh=dvnYejjyxHPajsiIBiGIrIczYbZrg4pXx/BgXizMHG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMTWEvmb1UeAyj5Iyifwg3/YxgBWiiWh/nNM8sRydhGHWuLJqRJRZg9ajChpQQmWSFS1Zlk4PjgQdQdcc4JqV/IYoj1+5H+2a+V8KonZB+tgW/rlbyFlUeHiOBile24NZ9hqIUbu6Ra4MlMqeDqgwxEHLZeTorZHMXXV+O+GDO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=ZYbi0CZP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1731053602; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NqbK1ULkwXgGHh2AtUu9V1jmzlLtpTU2Al5YkvAAM8RbD/W1HxBDb11ZM65iNfZVXfGtJPnhXaZST2+TIAltU/KBmUD/vnp8k495S3AEHwLYL67LkvafrbQvvT5nwKRfdbhUuIVrIECRmFDw7JEHw5MZAHutoRJDhJm9YnDNGN0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731053602; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JvSP8HEeSJi9q6o+/05Yo7yQ38q1D1gEnhynT0uGw/s=; 
	b=PqKuKD5fIp1OrZdmJcogW16j6z51SO1iC2SjNZbn4WcKLsKAQkWKch7ugyzJlCviFEPHGTf5thRMCnqfLxxl4gq+MsOdlYUyOsc69f34eJ0xbaBEJObX9nt4Uk5HJ0cJPF9/W6jorVgjzzmduGTaGtrqkLn7zXhFs9qb0jXgDLA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731053602;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=JvSP8HEeSJi9q6o+/05Yo7yQ38q1D1gEnhynT0uGw/s=;
	b=ZYbi0CZPg9D6RyzksZKuC1xY+/Ob8nVOJdOchFj63p146sviumyX+EqPsBiNEe6u
	sUh5wHVZwJWBdAlMrwpcRClVwCtxWKJy2ha+5WvKhEm8BPRuDcNQ04LOCbqLhNgeToO
	N9HA0JS2zRyGwdSt6K6KjTntGrEDpigAHjHzix7k=
Received: by mx.zohomail.com with SMTPS id 1731053600358768.0203535734115;
	Fri, 8 Nov 2024 00:13:20 -0800 (PST)
Date: Fri, 8 Nov 2024 09:13:15 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
	mauro.chehab@linux.intel.com, kernel@collabora.com,
	bob.beckett@collabora.com, nicolas.dufresne@collabora.com
Subject: Re: [PATCH 1/2] docs: Add guides section for debugging
Message-ID: <20241108081315.ln5ltvw3ssldonui@basti-XPS-13-9310>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
 <20241028-media_docs_improve_v3-v1-1-2b1b486c223e@collabora.com>
 <87ldxu235z.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ldxu235z.fsf@trenco.lwn.net>
X-ZohoMailClient: External

Hey Jonathan,

On 07.11.2024 13:35, Jonathan Corbet wrote:
>Sebastian Fricke <sebastian.fricke@collabora.com> writes:
>
>> This idea was formed after noticing that new developers experience
>> certain difficulty to navigate within the multitude of different
>> debugging options in the Kernel and while there often is good
>> documentation for the tools, the developer has to know first that they
>> exist and where to find them.
>> Add a general debugging section to the Kernel documentation, as an
>> easily locatable entry point to other documentation and as a general
>> guideline for the topic.
>>
>> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>> ---
>>  Documentation/index.rst                            |   2 +
>>  .../driver_development_debugging_guide.rst         | 206 +++++++++++++++
>>  Documentation/process/debugging/general_advice.rst |  48 ++++
>>  Documentation/process/debugging/index.rst          |  21 ++
>>  .../debugging/userspace_debugging_guide.rst        | 278 +++++++++++++++++++++
>>  5 files changed, 555 insertions(+)
>>
>> diff --git a/Documentation/index.rst b/Documentation/index.rst
>> index 36e61783437c..be19f0a79a6a 100644
>> --- a/Documentation/index.rst
>> +++ b/Documentation/index.rst
>> @@ -57,6 +57,7 @@ Various other manuals with useful information for all kernel developers.
>>     dev-tools/testing-overview
>>     kernel-hacking/index
>>     trace/index
>> +   process/debugging/index
>>     fault-injection/index
>
>Please, let's not add this to the top-level page.  I've been through a
>multi-year struggle trying to trim that page down to the point where it
>is possible to actually find something of interest there.  Everybody
>wants their stuff up front, but please link this from the process guide
>instead.

Hmmm ... we are talking about a page for newbies here, when it is under
process the person will have to figure out first that one has to click
on All development-process docs and then find that document under the
abundance of others. Could we atleast generate a top level page called
Beginner intro or something similar, where you are guided through the
documentation tree from the perspective of a beginner?

>
>>     livepatch/index
>>     rust/index
>> @@ -76,6 +77,7 @@ developers seeking information on the kernel's user-space APIs.
>>     The kernel build system <kbuild/index>
>>     admin-guide/reporting-issues.rst
>>     User-space tools <tools/index>
>> +   process/debugging/userspace_debugging_guide.rst
>>     userspace-api/index
>
>...and linking it twice from that page is even worse...

Ack.

>
>>  See also: the `Linux man pages <https://www.kernel.org/doc/man-pages/>`_,
>> diff --git a/Documentation/process/debugging/driver_development_debugging_guide.rst b/Documentation/process/debugging/driver_development_debugging_guide.rst
>> new file mode 100644
>> index 000000000000..f3d9c2c192c4
>> --- /dev/null
>> +++ b/Documentation/process/debugging/driver_development_debugging_guide.rst
>> @@ -0,0 +1,206 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +========================================
>> +Debugging advice for driver development
>> +========================================
>> +
>> +This document serves as a general starting point and lookup for debugging device
>> +drivers.
>> +While this guide focuses on debugging that requires re-compiling the
>> +module/kernel, the :doc:`userspace debugging guide
>> +</process/debugging/userspace_debugging_guide>` will guide
>> +you through tools like dynamic debug, ftrace and other tools useful for
>> +debugging issues and behavior.
>> +For general debugging advice, see the :doc:`general advice document
>> +</process/debugging/general_advice>`.
>> +
>> +.. contents::
>> +    :depth: 3
>
>Not sure this is necessary for these short files, but whatever
>
>> +The following sections show you the available tools.
>> +
>> +Printk & friends
>> +----------------
>
>When referencing the function, say printk() - that's the convention we
>use.

Ah even in the title? Can do. (Even though it makes the titles look less
uniform..)

>
>> +
>> +These are derivatives of printf() with varying destinations and support for
>> +being dynamically turned on or off, or lack thereof.
>> +
>> +Simple printk

... so meaning here as well I guess.

>> +~~~~~~~~~~~~~
>> +
>> +The classic, can be used to great effect for quick and dirty development
>> +of new modules or to extract arbitrary necessary data for troubleshooting.
>> +
>> +Prerequisite: `CONFIG_PRINTK` (usually enabled by default)
>> +
>> +**Pros**:
>> +
>> +- No need to learn anything, simple to use
>> +- Easy to modify exactly to your needs (formatting of the data (See:
>> +  :doc:`/core-api/printk-formats`), visibility in the log)
>> +- Can cause delays in the execution of the code (beneficial to confirm whether
>> +  timing is a factor)
>> +
>> +**Cons**:
>> +
>> +- Requires rebuilding the kernel/module
>> +- Can cause delays in the execution of the code (which can cause issues to be
>> +  not reproducible)
>> +
>> +For the full documentation see :doc:`/core-api/printk-basics`
>> +
>> +Trace_printk
>> +~~~~~~~~~~~~
>> +
>> +Prerequisite: `CONFIG_DYNAMIC_FTRACE` & `#include <linux/ftrace.h>`
>> +
>> +It is a tiny bit less comfortable to use than printk(), because you will have
>> +to read the messages from the trace file (See: :ref:`read_ftrace_log`
>> +instead of from the kernel log, but very useful when printk() adds unwanted
>> +delays into the code execution, causing issues to be flaky or hidden.)
>> +
>> +If the processing of this still causes timing issues then you can try
>> +trace_puts().
>> +
>> +For the full Documentation see trace_printk()
>> +
>> +dev_dbg
>> +~~~~~~~
>> +
>> +Print statement, which can be targeted by :ref:`process/debugging/userspace_debugging_guide:dynamic debug`
>
>It would still be nice to stick to the line-length limit wherever
>possible.  Here it is possible.
>
>> +that contains additional information about the device used within the context.
>> +
>> +**When is it appropriate to leave a debug print in the code?**
>> +
>> +Permanent debug statements have to be useful for a developer to troubleshoot
>> +driver misbehavior. Judging that is a bit more of an art than a science, but
>> +some guidelines are in the :ref:`Coding style guidelines <process/coding-style:13) printing kernel messages>`
>
>Here too.

Sorry missed these two.

>
>Working drivers are supposed to be quiet, though, so I think the real
>answer to this question is "almost never".

Yes I can highlight that the answer should be No in almost all cases.

>
>> +Custom printk
>> +~~~~~~~~~~~~~
>> +
>> +Example::
>> +
>> +  #define core_dbg(fmt, arg...) do { \
>> +	  if (core_debug) \
>> +		  printk(KERN_DEBUG pr_fmt("core: " fmt), ## arg); \
>> +	  } while (0)
>> +
>> +**When should you do this?**
>> +
>> +It is better to just use a pr_debug(), which can later be turned on/off with
>> +dynamic debug. Additionally, a lot of drivers activate these prints via a
>> +variable like `core_debug` set by a module parameter. However, Module
>
>If you really want to mark up that name, it should probably be ``literal``

Ack.

>
>> +parameters `are not recommended anymore
>> +<https://lore.kernel.org/all/2024032757-surcharge-grime-d3dd@gregkh>`_.
>> +
>> +Ftrace
>> +------
>> +
>> +Creating a custom Ftrace tracepoint
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>This seems ... minimal.  It would be good to have, if nothing else, a
>paragraph explaining what a tracepoint is and how it might be useful.

Ack.

>
>> +Here is a basic description of :ref:`how to implement new tracepoints
>> +<trace/tracepoints:usage>`.
>> +
>> +For the full event tracing documentation see :doc:`/trace/events`
>> +
>> +For the full Ftrace documentation see :doc:`/trace/ftrace`
>> +
>> +DebugFS
>> +-------
>> +
>> +Prerequisite: `CONFIG_DEBUG_FS` & `#include <linux/debugfs.h>`
>> +
>> +DebugFS differs from the other approaches of debugging, as it doesn't write
>> +messages to the kernel log nor add traces to the code. Instead it allows the
>> +developer to handle a set of files.
>> +With these files you can either store values of variables or make
>> +register/memory dumps or you can make these files writable and modify
>> +values/settings in the driver.
>> +
>> +Possible use-cases among others:
>> +
>> +- Store register values
>> +- Keep track of variables
>> +- Store errors
>> +- Store settings
>> +- Toggle a setting like debug on/off
>> +- Error injection
>> +
>> +This is especially useful, when the size of a data dump would be hard to digest
>> +as part of the general kernel log (for example when dumping raw bitstream data)
>> +or when you are not interested in all the values all the time, but with the
>> +possibility to inspect them.
>> +
>> +The general idea is:
>> +
>> +- Create a directory during probe (`struct dentry *parent =
>> +  debugfs_create_dir("my_driver", NULL);`)
>
>Again, I think this wants to be literal, not italic?

Ack.

>
>> +- Create a file (`debugfs_create_u32("my_value", 444, parent, &my_variable);`)
>> +
>> +  - In this example the file is found in `/sys/kernel/debug/my_driver/my_value`
>> +    (with read permissions for user/group/all)
>> +  - any update of `my_variable` will update the value in the file
>
>That's a bit of a strange way to put it.  I would say that any read of
>the file will return the current contents of the variable.

Ack.

>
>> +- Clean up the folder when removing the device
>> +  (`debugfs_remove_recursive(parent);`)
>> +
>> +For the full documentation see :doc:`/filesystems/debugfs`.
>> +
>> +KASAN, UBSAN, lockdep and other error checkers
>> +----------------------------------------------
>> +
>> +KASAN (Kernel Address Sanitizer)
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +Prerequisite: `CONFIG_KASAN`
>> +
>> +KASAN is a dynamic memory error detector that helps to find use-after-free and
>> +out-of-bounds bugs. It uses compile-time instrumentation to check every memory
>> +access.
>> +
>> +For the full documentation see :doc:`/dev-tools/kasan`.
>> +
>> +UBSAN (Undefined Behavior Sanitizer)
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +Prerequisite: `CONFIG_UBSAN`
>> +
>> +UBSAN relies on compiler instrumentation and runtime checks to detect undefined
>> +behavior. It is designed to find a variety of issues, including signed integer
>> +overflow, array index out of bounds, and more.
>> +
>> +For the full documentation see :doc:`/dev-tools/ubsan`
>> +
>> +lockdep (Lock Dependency Validator)
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +Prerequisite: `CONFIG_DEBUG_LOCKDEP`
>> +
>> +lockdep is a runtime lock dependency validator that detects potential deadlocks
>> +and other locking-related issues in the kernel.
>> +It tracks lock acquisitions and releases, building a dependency graph that is
>> +analyzed for potential deadlocks.
>> +lockdep is especially useful for validating the correctness of lock ordering in
>> +the kernel.
>> +
>> +For the full documentation see :doc:`/RCU/lockdep`
>
>That is anything but full documentation of lockdep; it's really only
>about RCU.  I wish (hint :) that we had proper documentation for lockdep
>that we could link here.  For the purposes of a reader who needs this
>level of guide, though, linking deep into RCU is not likely to be
>helpful.

Yep I struggled finiding something useful for this topic in the docs.
I'd say I skip adding a link for now and we can create another MR later
to add a proper documentation + link in the documentation.

>
>> +device coredump
>> +---------------
>> +
>> +Prerequisite: `#include <linux/devcoredump.h>`
>> +
>> +Provides the infrastructure for a driver to provide arbitrary data to userland.
>> +It is most often used in conjunction with udev or similar userland application
>> +to listen for kernel uevents, which indicate that the dump is ready. Udev has
>> +rules to copy that file somewhere for long-term storage and analysis, as by
>> +default, the data for the dump is automatically cleaned up after 5 minutes.
>> +That data is analyzed with driver-specific tools or GDB.
>> +
>> +You can find an example implementation at:
>> +`drivers/media/platform/qcom/venus/core.c
>> +<https://elixir.bootlin.com/linux/v6.11.6/source/drivers/media/platform/qcom/venus/core.c#L30>`__
>> +
>> +**Copyright** ©2024 : Collabora
>> diff --git a/Documentation/process/debugging/general_advice.rst b/Documentation/process/debugging/general_advice.rst
>> new file mode 100644
>> index 000000000000..631430656d53
>> --- /dev/null
>> +++ b/Documentation/process/debugging/general_advice.rst
>> @@ -0,0 +1,48 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +General debugging advice
>> +========================
>> +
>> +Depending on the issue, a different set of tools is available to track down the
>> +problem or even to realize whether there is one in the first place.
>> +
>> +As a first step you have to figure out what kind of issue you want to debug.
>> +Depending on the answer, your methodology and choice of tools may vary.
>> +
>> +Do I need to debug with limited access?
>> +---------------------------------------
>> +
>> +Do you have limited access to the machine or are you unable to stop the running
>> +execution?
>> +
>> +In this case your debugging capability depends on built-in debugging support of
>> +provided distro kernel.
>> +The :doc:`/process/debugging/userspace_debugging_guide` provides a brief
>> +overview over range of possible debugging tools in that situation. You can
>> +check the capability of your kernel, in most cases, by looking into config file
>> +within the /boot folder.
>> +
>> +Do I have root access to the system?
>> +------------------------------------
>> +
>> +Are you easily able to replace the module in question or to install a new
>> +kernel?
>> +
>> +In that case your range of available tools is a lot bigger, you can find the
>> +tools in the :doc:`/process/debugging/driver_development_debugging_guide`.
>> +
>> +Is timing a factor?
>> +-------------------
>> +
>> +It is important to understand if the problem you want to debug manifests itself
>> +consistently (i.e. given a set of inputs you always get the same, incorrect
>> +output), or inconsistently. If it manifests itself inconsistently, some timing
>> +factor might be at play. If inserting delays into the code does change the
>> +behavior, then quite likely timing is a factor.
>> +
>> +When timing does alter the outcome of the code execution using a simple
>> +printk() for debugging purposes won't work, a similar alternative is to use
>
>I'd s/won't/may not/
>
>> +trace_printk() , which logs the debug messages to the trace file instead of the
>> +kernel log.
>> +
>> +**Copyright** ©2024 : Collabora
>> diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
>> new file mode 100644
>> index 000000000000..c200ede7c955
>> --- /dev/null
>> +++ b/Documentation/process/debugging/index.rst
>> @@ -0,0 +1,21 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +============================================
>> +Debugging advice for Linux Kernel developers
>> +============================================
>> +
>
>This file needs an introductory paragraph (at least) saying what it is
>about.  A simple directory listing is not hugely useful.
>
>An alternative might be to turn your "general advice" document into the
>index.rst file.

Well that is what I had in the previous iteration and Bagas Sanjaya told me:
>Please split general debugging advice into its own doc (e.g. at
>general-advice.rst). Most other docs have index.rst only for toctree
>listing.

So, shall I revert that or should I add a intro sentence to the index
file?

>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +   general_advice
>> +   driver_development_debugging_guide
>> +   userspace_debugging_guide
>> +
>> +.. only::  subproject and html
>> +
>> +   Indices
>> +   =======
>> +
>> +   * :ref:`genindex`
>> +
>> +**Copyright** ©2024 : Collabora
>> diff --git a/Documentation/process/debugging/userspace_debugging_guide.rst b/Documentation/process/debugging/userspace_debugging_guide.rst
>> new file mode 100644
>> index 000000000000..0afe35c468a9
>> --- /dev/null
>> +++ b/Documentation/process/debugging/userspace_debugging_guide.rst
>> @@ -0,0 +1,278 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +==========================
>> +Userspace debugging advice
>> +==========================
>> +
>> +A brief overview of common tools to debug the Linux Kernel from userspace.
>> +For debugging advice aimed at driver developer go :doc:`here
>> +</process/debugging/driver_development_debugging_guide>`.
>> +For general debugging advice, see :doc:`general-debugging-guide
>> +</process/debugging/general_advice>`.
>> +
>> +.. contents::
>> +    :depth: 3
>> +
>> +The following sections show you the available tools.
>> +
>> +Dynamic debug
>> +-------------
>> +
>> +Mechanism to filter what ends up in the kernel log by dis-/en-abling log
>> +messages.
>> +
>> +Prerequisite: `CONFIG_DYNAMIC_DEBUG`
>> +
>> +.. _valid_dyndbg_prints:
>> +
>> +Dynamic debug is only able to target:
>> +
>> +- pr_debug()
>> +- dev_dbg()
>> +- print_hex_dump_debug()
>> +- print_hex_dump_bytes()
>
>It would, of course, be nice to set up kerneldoc for all of those
>functions so that these lines link through to something useful.  The
>last one has kerneldoc, it just needs to be pulled in somewhere.
>
>> +Therefore the usability of this tool is, as of now, quite limited as there is
>> +no uniform rule for adding debug prints to the codebase, resulting in a variety
>> +of ways these prints are implemented.
>> +
>> +Also, note that most debug statements are implemented as a variation of
>> +dprintk(), which have to be activated via a parameter in respective module,
>> +dynamic debug is unable to do that step for you.
>> +
>> +Here is one example, that enables all available pr_debug() 's within the file::
>> +
>> +  $ alias ddcmd='echo $* > /proc/dynamic_debug/control'
>> +  $ ddcmd '-p; file v4l2-h264.c +p'
>
>It seems to me that the alias just obfuscates things, why bother?

Well because the Linux Kernel documentation suggests that :P
https://docs.kernel.org/admin-guide/dynamic-debug-howto.html#controlling-dynamic-debug-behaviour

If you don't like that, then I think I should send a MR for that file as
well.

>
>> +  $ grep =p /proc/dynamic_debug/control
>> +   drivers/media/v4l2-core/v4l2-h264.c:372 [v4l2_h264]print_ref_list_b =p
>> +   "ref_pic_list_b%u (cur_poc %u%c) %s"
>> +   drivers/media/v4l2-core/v4l2-h264.c:333 [v4l2_h264]print_ref_list_p =p
>> +   "ref_pic_list_p (cur_poc %u%c) %s\n"
>
>What does this output tell the reader?

It tells the reader that these two debug print statements are going to
displayed, while everything else is hidden. I will add a sentence.

>
>> +**When should you use this over** `Ftrace`_ **?**
>
>All that markup to link five lines down?

Yes you are right, that is maybe not super useful.

>
>> +- When the code contains one of the :ref:`valid print statements
>> +  <valid_dyndbg_prints>` or when you have added multiple pr_debug()
>
>Do we really need to go through adding the label and markup just to link
>a half-screen up the page?

Good point I can just say see above in this case

>
>> +  statements during development
>> +- When timing is not an issue, meaning if multiple pr_debug() statements in
>> +  the code won't cause delays
>> +- When you care more about receiving specific log messages than tracing the
>> +  pattern of how a function is called
>> +
>> +For the full documentation see :doc:`/admin-guide/dynamic-debug-howto`
>> +
>> +Ftrace
>> +------
>> +
>> +Prerequisite: `CONFIG_DYNAMIC_FTRACE`
>> +
>> +You can find the tracing folder in either `/sys/kernel/` or `/sys/debug/kernel/`.
>
>Maybe tell the poor reader what "the tracing folder" is?

Ack.

>
>> +Some of the most important operations for debugging are:
>> +
>> +- You can perform a function trace by adding a function name to the
>> +  `set_ftrace_filter` file (which accepts any function name found within the
>> +  `available_filter_functions` file) or you can specifically disable certain
>> +  functions by adding their names to the `set_ftrace_notrace` file (More info
>> +  at: :ref:`trace/ftrace:dynamic ftrace`).
>> +- In order to find out where the calls originates from you can activate the
>> +  `func_stack_trace` option under `options/func_stack_trace`.
>> +- Tracing the children of a function call and showing the return values is
>> +  possible by adding the desired function in the `set_graph_function` file
>> +  (requires config `FUNCTION_GRAPH_RETVAL`) more info at
>> +  :ref:`trace/ftrace:dynamic ftrace with the function graph tracer`.
>> +
>> +For the full Ftrace documentation see :doc:`/trace/ftrace`
>> +
>> +Or you could also trace for specific events by :ref:`using event tracing
>> +<trace/events:2. using event tracing>`, which can be defined as described here:
>> +:ref:`Creating a custom Ftrace tracepoint
>> +<process/debugging/driver_development_debugging_guide:ftrace>`.
>> +
>> +For the full Ftrace event tracing documentation see :doc:`/trace/events`
>> +
>> +.. _read_ftrace_log:
>> +
>> +Reading the ftrace log
>> +~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +The `trace` file can be read just like any other file (`cat`, `tail`, `head`,
>> +`vim`, etc.), the size of the file is limited by the `buffer_size_kb` (``echo
>> +1000 > buffer_size_kb``). The :ref:`trace/ftrace:trace_pipe` will behave
>> +similar to the `trace` file, but whenever you read from the file the content is
>> +consumed.
>> +
>> +Kernelshark
>> +~~~~~~~~~~~
>> +
>> +A GUI interface to visualize the traces as a graph and list view from the
>> +output of the `trace-cmd
>> +<https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/>`__ application.
>> +
>> +For the full documentation see `<https://kernelshark.org/Documentation.html>`__
>> +
>> +Perf & alternatives
>> +-------------------
>> +
>> +The tools mentioned above provide ways to inspect kernel code, results, variable values, etc.
>> +Sometimes you have to find out first where to look and for those cases, a box of
>> +performance tracking tools can help you to frame the issue.
>> +
>> +Why should you do a performance analysis?
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +A performance analysis is a good first step when among other reasons:
>> +
>> +- you cannot define the issue
>> +- you do not know where it occurs
>> +- the running system should not be interrupted or it is a remote system, where
>> +  you cannot install a new module/kernel
>> +
>> +How to do a simple analysis with linux tools?
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +For the start of a performance analysis, you can start with the usual tools
>> +like:
>> +
>> +- `top` / `htop` / `atop` (*get an overview of the system load, see spikes on
>> +  specific processes*)
>> +- `mpstat -P ALL` (*look at the load distribution among CPUs*)
>> +- `iostat -x` (*observe input and output devices utilization and performance*)
>> +- `vmstat` (*overview of memory usage on the system*)
>> +- `pidstat` (*similar to* `vmstat` *but per process, to dial it down to the
>> +  target*)
>> +- `strace -tp $PID` (*once you know the process, you can figure out how it
>> +  communicates with the Kernel*)
>> +
>> +These should help to narrow down the areas to look at sufficiently.
>> +
>> +Diving deeper with perf
>> +~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +The **perf** tool provides a series of metrics and events to further dial down
>> +on issues.
>> +
>> +Prerequisite: build or install perf on your system
>> +
>> +Gather statistics data for finding all files starting with `gcc` in `/usr`::
>> +
>> +  # perf stat -d find /usr -name 'gcc*' | wc -l
>> +
>> +   Performance counter stats for 'find /usr -name gcc*':
>> +
>> +     1277.81 msec    task-clock             #    0.997 CPUs utilized
>> +     9               context-switches       #    7.043 /sec
>> +     1               cpu-migrations         #    0.783 /sec
>> +     704             page-faults            #  550.943 /sec
>> +     766548897       cycles                 #    0.600 GHz                         (97.15%)
>> +     798285467       instructions           #    1.04  insn per cycle              (97.15%)
>> +     57582731        branches               #   45.064 M/sec                       (2.85%)
>> +     3842573         branch-misses          #    6.67% of all branches             (97.15%)
>> +     281616097       L1-dcache-loads        #  220.390 M/sec                       (97.15%)
>> +     4220975         L1-dcache-load-misses  #    1.50% of all L1-dcache accesses   (97.15%)
>> +     <not supported> LLC-loads
>> +     <not supported> LLC-load-misses
>> +
>> +   1.281746009 seconds time elapsed
>> +
>> +   0.508796000 seconds user
>> +   0.773209000 seconds sys
>> +
>> +
>> +  52
>> +
>> +The availability of events and metrics depends on the system you are running.
>> +
>> +For the full documentation see
>> +`<https://perf.wiki.kernel.org/index.php/Main_Page>`__
>> +
>> +Perfetto
>> +~~~~~~~~
>> +
>> +A set of tools to measure and analyze how well applications and systems perform.
>> +You can use it to:
>> +
>> +* identify bottlenecks
>> +* optimize code
>> +* make software run faster and more efficiently.
>> +
>> +**What is the difference between perfetto and perf?**
>> +
>> +* perf is tool as part of and specialized for the Linux Kernel and has CLI user
>> +  interface.
>> +* perfetto cross-platform performance analysis stack, has extended
>> +  functionality into userspace and provides a WEB user interface.
>> +
>> +For the full documentation see `<https://perfetto.dev/docs/>`__
>> +
>> +Kernel panic analysis tools
>> +---------------------------
>> +
>> +  To analyse the crash dump please use `Kdump` & `Kexec`.
>
>Those will not *analyze* a crash dump.

Well yes they will capture the crash dump, which can then be used to
analyse the crash. Maybe a better wording is:

To capture the crash dump please use `Kdump` & `Kexec`. Below you can
find some advice for analysing the data.

better?

>
>> +  For the full documentation see the :doc:`/admin-guide/kdump/kdump`
>> +
>> +  In order to find the corresponding line in the code you can use `faddr2line
>> +  <https://elixir.bootlin.com/linux/v6.11.6/source/scripts/faddr2line>`__, note
>> +  that you need to enable `CONFIG_DEBUG_INFO` for that to work.
>> +
>> +  An alternative to using `faddr2line` is the use of `objdump` (and it's
>> +  derivatives for the different platforms like `aarch64-linux-gnu-objdump`),
>> +  take this line as an example:
>> +
>> +  `[  +0.000240]  rkvdec_device_run+0x50/0x138 [rockchip_vdec]`.
>> +
>> +  We can find the corresponding line of code by executing::
>> +
>> +    aarch64-linux-gnu-objdump -dS drivers/staging/media/rkvdec/rockchip-vdec.ko | grep rkvdec_device_run\>: -A 40
>> +    0000000000000ac8 <rkvdec_device_run>:
>> +     ac8:	d503201f 	nop
>> +     acc:	d503201f 	nop
>> +    {
>> +     ad0:	d503233f 	paciasp
>> +     ad4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
>> +     ad8:	910003fd 	mov	x29, sp
>> +     adc:	a90153f3 	stp	x19, x20, [sp, #16]
>> +     ae0:	a9025bf5 	stp	x21, x22, [sp, #32]
>> +        const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
>> +     ae4:	f9411814 	ldr	x20, [x0, #560]
>> +        struct rkvdec_dev *rkvdec = ctx->dev;
>> +     ae8:	f9418015 	ldr	x21, [x0, #768]
>> +        if (WARN_ON(!desc))
>> +     aec:	b4000654 	cbz	x20, bb4 <rkvdec_device_run+0xec>
>> +        ret = pm_runtime_resume_and_get(rkvdec->dev);
>> +     af0:	f943d2b6 	ldr	x22, [x21, #1952]
>> +        ret = __pm_runtime_resume(dev, RPM_GET_PUT);
>> +     af4:	aa0003f3 	mov	x19, x0
>> +     af8:	52800081 	mov	w1, #0x4                   	// #4
>> +     afc:	aa1603e0 	mov	x0, x22
>> +     b00:	94000000 	bl	0 <__pm_runtime_resume>
>> +        if (ret < 0) {
>> +     b04:	37f80340 	tbnz	w0, #31, b6c <rkvdec_device_run+0xa4>
>> +        dev_warn(rkvdec->dev, "Not good\n");
>> +     b08:	f943d2a0 	ldr	x0, [x21, #1952]
>> +     b0c:	90000001 	adrp	x1, 0 <rkvdec_try_ctrl-0x8>
>> +     b10:	91000021 	add	x1, x1, #0x0
>> +     b14:	94000000 	bl	0 <_dev_warn>
>> +        *bad = 1;
>> +     b18:	d2800001 	mov	x1, #0x0                   	// #0
>> +     ...
>> +
>> +  Meaning, in this line from the crash dump::
>> +
>> +    [  +0.000240]  rkvdec_device_run+0x50/0x138 [rockchip_vdec]
>> +
>> +  I can take the `0x50` as offset, which I have to add to the base address
>> +  of the corresponding function, which I find in this line::
>> +
>> +    0000000000000ac8 <rkvdec_device_run>:
>> +
>> +  The result of `0xac8 + 0x50 = 0xb18`
>> +  And when I search for that address within the function I get the
>> +  following line::
>> +
>> +    *bad = 1;
>> +    b18:      d2800001        mov     x1, #0x0
>> +
>> +**Copyright** ©2024 : Collabora
>
>Thanks,
>
>jon
>
Regards,
Sebastian Fricke

