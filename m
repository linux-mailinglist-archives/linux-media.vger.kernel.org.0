Return-Path: <linux-media+bounces-21371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9B49C6DF6
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 12:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46FE3B2AB55
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 11:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAD4200CA7;
	Wed, 13 Nov 2024 11:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="OSHHt6C2"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D8D200C8A;
	Wed, 13 Nov 2024 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496664; cv=pass; b=FVSesNKkrdSaRwKllsOdGWy1rCdN+t5f2Q/Cqi4W8BbcckN4JbbVAt0K/rm++p5d1m5B73v+eG5BNLZnFyuVhDpN+YV8JQLgL0TgrQDFk8Hl7QYGIo9nhxVJgMkAfoRCjLVNWnBqoTXdxFpQDptIhgGpTnY7FJ1xadeFU1E/TW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496664; c=relaxed/simple;
	bh=uQVa72k+FRzIAqZLDsZkWUDdyEr9Sp2UGkFJvgwOUIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWaLSVvxwlTZ8/vO5W2qiR8PIbRnoZs9SeZougHsOFyTsto/Ci5goZ/luMM34lUmfrnpYudN67ZR3P7CwO8EzX4rA1N5hmKuuzn98Ugsn+wjYsL+xpWeP8dknjFkd7jMy4x2PCjCh3TCymY9lLI39a5C9LIUUONcj+zDscRBK7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=OSHHt6C2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1731496644; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VRJY9bOTGWA8bANC2yGzgktKe60PFM4AxTvfsnm3k8oqb6Y0wBTuw0hKBPwZ7PtRHYCOPq2p0o5nX+AL2XvKUG3zE/OIqhucUfauSIoMzjFMnUPH7bxlsyBeI4Xzue26Wm4hycK2Ud8UWJoyrTolUZ+zBL1T9CLym71VPInKnqM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731496644; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7/aZXTFLUF1Y65tTLpwwF/RxS/sT8ZyuujS79ycIcMM=; 
	b=jlqFXsrytXRzDh33aWG8OTA5CC4onYywfn4/hUlNb3ls4phCW6+SEwSkVhYsqEEvayTyLPNmekmRXi4EMfNgd7euHvUuLl2Nh5kp3vK4ZEoTXhTSM2IwLaJaDPpSCbz0EvREYkVKS62HuSciChx7jIMCNduHxvi3Zd0mPdzS2BE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731496644;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=7/aZXTFLUF1Y65tTLpwwF/RxS/sT8ZyuujS79ycIcMM=;
	b=OSHHt6C2Fxh3PnU6ap6e0OG+XQa6LZAgR0gzBm4R6HP2k65hjF2QALjKdyqqh8qa
	WC+0i+5WCWnup8Aa2cH6NkJ5uTNGGJPeM309qvP4JEFczL6rTC/AGd3dWgLwvzy/h8t
	hX/YKiOmXEoG4wnwhSLruJDe81awOtNLPYlz6PmM=
Received: by mx.zohomail.com with SMTPS id 173149664412252.352146879811585;
	Wed, 13 Nov 2024 03:17:24 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Wed, 13 Nov 2024 12:17:09 +0100
Subject: [PATCH v2 1/2] docs: Add debugging section to process
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241028-media_docs_improve_v3-v2-1-f1960ae22c5d@collabora.com>
References: <20241028-media_docs_improve_v3-v2-0-f1960ae22c5d@collabora.com>
In-Reply-To: <20241028-media_docs_improve_v3-v2-0-f1960ae22c5d@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, kernel@collabora.com, bob.beckett@collabora.com,
 nicolas.dufresne@collabora.com,
 Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731496634; l=23703;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=uQVa72k+FRzIAqZLDsZkWUDdyEr9Sp2UGkFJvgwOUIc=;
 b=LPtiv9uf3WdLZj6qIeFOWc3SM3HdPlb6nUCpz6FPBmcBgr0XjJfTeE9J1BSq3WMoYC5A7ARHegAz
 wsTZ4s6cChy4f77pN7TLrWqs9Bp2fUvcY90T70FeL4b/v4rA6mej
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

This idea was formed after noticing that new developers experience
certain difficulty to navigate within the multitude of different
debugging options in the Kernel and while there often is good
documentation for the tools, the developer has to know first that they
exist and where to find them.
Add a general debugging section to the Kernel documentation, as an
easily locatable entry point to other documentation and as a general
guideline for the topic.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 .../driver_development_debugging_guide.rst         | 214 ++++++++++++++++
 Documentation/process/debugging/index.rst          |  65 +++++
 .../debugging/userspace_debugging_guide.rst        | 278 +++++++++++++++++++++
 Documentation/process/index.rst                    |   8 +-
 4 files changed, 562 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/debugging/driver_development_debugging_guide.rst b/Documentation/process/debugging/driver_development_debugging_guide.rst
new file mode 100644
index 000000000000..bfeefb242b03
--- /dev/null
+++ b/Documentation/process/debugging/driver_development_debugging_guide.rst
@@ -0,0 +1,214 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================================
+Debugging advice for driver development
+========================================
+
+This document serves as a general starting point and lookup for debugging device
+drivers.
+While this guide focuses on debugging that requires re-compiling the
+module/kernel, the :doc:`userspace debugging guide
+</process/debugging/userspace_debugging_guide>` will guide
+you through tools like dynamic debug, ftrace and other tools useful for
+debugging issues and behavior.
+For general debugging advice, see the :doc:`general advice document
+</process/debugging/index>`.
+
+.. contents::
+    :depth: 3
+
+The following sections show you the available tools.
+
+printk() & friends
+------------------
+
+These are derivatives of printf() with varying destinations and support for
+being dynamically turned on or off, or lack thereof.
+
+Simple printk()
+~~~~~~~~~~~~~~~
+
+The classic, can be used to great effect for quick and dirty development
+of new modules or to extract arbitrary necessary data for troubleshooting.
+
+Prerequisite: ``CONFIG_PRINTK`` (usually enabled by default)
+
+**Pros**:
+
+- No need to learn anything, simple to use
+- Easy to modify exactly to your needs (formatting of the data (See:
+  :doc:`/core-api/printk-formats`), visibility in the log)
+- Can cause delays in the execution of the code (beneficial to confirm whether
+  timing is a factor)
+
+**Cons**:
+
+- Requires rebuilding the kernel/module
+- Can cause delays in the execution of the code (which can cause issues to be
+  not reproducible)
+
+For the full documentation see :doc:`/core-api/printk-basics`
+
+Trace_printk
+~~~~~~~~~~~~
+
+Prerequisite: ``CONFIG_DYNAMIC_FTRACE`` & ``#include <linux/ftrace.h>``
+
+It is a tiny bit less comfortable to use than printk(), because you will have
+to read the messages from the trace file (See: :ref:`read_ftrace_log`
+instead of from the kernel log, but very useful when printk() adds unwanted
+delays into the code execution, causing issues to be flaky or hidden.)
+
+If the processing of this still causes timing issues then you can try
+trace_puts().
+
+For the full Documentation see trace_printk()
+
+dev_dbg
+~~~~~~~
+
+Print statement, which can be targeted by
+:ref:`process/debugging/userspace_debugging_guide:dynamic debug` that contains
+additional information about the device used within the context.
+
+**When is it appropriate to leave a debug print in the code?**
+
+Permanent debug statements have to be useful for a developer to troubleshoot
+driver misbehavior. Judging that is a bit more of an art than a science, but
+some guidelines are in the :ref:`Coding style guidelines
+<process/coding-style:13) printing kernel messages>`. In almost all cases the
+debug statements shouldn't be upstreamed, as a working driver is supposed to be
+silent.
+
+Custom printk
+~~~~~~~~~~~~~
+
+Example::
+
+  #define core_dbg(fmt, arg...) do { \
+	  if (core_debug) \
+		  printk(KERN_DEBUG pr_fmt("core: " fmt), ## arg); \
+	  } while (0)
+
+**When should you do this?**
+
+It is better to just use a pr_debug(), which can later be turned on/off with
+dynamic debug. Additionally, a lot of drivers activate these prints via a
+variable like ``core_debug`` set by a module parameter. However, Module
+parameters `are not recommended anymore
+<https://lore.kernel.org/all/2024032757-surcharge-grime-d3dd@gregkh>`_.
+
+Ftrace
+------
+
+Creating a custom Ftrace tracepoint
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A tracepoint adds a hook into your code that will be called and logged when the
+tracepoint is enabled. This can be used, for example, to trace hitting a
+conditional branch or to dump the internal state at specific points of the code
+flow during a debugging session.
+
+Here is a basic description of :ref:`how to implement new tracepoints
+<trace/tracepoints:usage>`.
+
+For the full event tracing documentation see :doc:`/trace/events`
+
+For the full Ftrace documentation see :doc:`/trace/ftrace`
+
+DebugFS
+-------
+
+Prerequisite: ``CONFIG_DEBUG_FS` & `#include <linux/debugfs.h>``
+
+DebugFS differs from the other approaches of debugging, as it doesn't write
+messages to the kernel log nor add traces to the code. Instead it allows the
+developer to handle a set of files.
+With these files you can either store values of variables or make
+register/memory dumps or you can make these files writable and modify
+values/settings in the driver.
+
+Possible use-cases among others:
+
+- Store register values
+- Keep track of variables
+- Store errors
+- Store settings
+- Toggle a setting like debug on/off
+- Error injection
+
+This is especially useful, when the size of a data dump would be hard to digest
+as part of the general kernel log (for example when dumping raw bitstream data)
+or when you are not interested in all the values all the time, but with the
+possibility to inspect them.
+
+The general idea is:
+
+- Create a directory during probe (``struct dentry *parent =
+  debugfs_create_dir("my_driver", NULL);``)
+- Create a file (``debugfs_create_u32("my_value", 444, parent, &my_variable);``)
+
+  - In this example the file is found in ``/sys/kernel/debug/my_driver/my_value``
+    (with read permissions for user/group/all)
+  - any read of the file will return the current contents of the variable
+    ``my_variable``
+
+- Clean up the folder when removing the device
+  (``debugfs_remove_recursive(parent);``)
+
+For the full documentation see :doc:`/filesystems/debugfs`.
+
+KASAN, UBSAN, lockdep and other error checkers
+----------------------------------------------
+
+KASAN (Kernel Address Sanitizer)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Prerequisite: ``CONFIG_KASAN``
+
+KASAN is a dynamic memory error detector that helps to find use-after-free and
+out-of-bounds bugs. It uses compile-time instrumentation to check every memory
+access.
+
+For the full documentation see :doc:`/dev-tools/kasan`.
+
+UBSAN (Undefined Behavior Sanitizer)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Prerequisite: ``CONFIG_UBSAN``
+
+UBSAN relies on compiler instrumentation and runtime checks to detect undefined
+behavior. It is designed to find a variety of issues, including signed integer
+overflow, array index out of bounds, and more.
+
+For the full documentation see :doc:`/dev-tools/ubsan`
+
+lockdep (Lock Dependency Validator)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Prerequisite: ``CONFIG_DEBUG_LOCKDEP``
+
+lockdep is a runtime lock dependency validator that detects potential deadlocks
+and other locking-related issues in the kernel.
+It tracks lock acquisitions and releases, building a dependency graph that is
+analyzed for potential deadlocks.
+lockdep is especially useful for validating the correctness of lock ordering in
+the kernel.
+
+device coredump
+---------------
+
+Prerequisite: ``#include <linux/devcoredump.h>``
+
+Provides the infrastructure for a driver to provide arbitrary data to userland.
+It is most often used in conjunction with udev or similar userland application
+to listen for kernel uevents, which indicate that the dump is ready. Udev has
+rules to copy that file somewhere for long-term storage and analysis, as by
+default, the data for the dump is automatically cleaned up after 5 minutes.
+That data is analyzed with driver-specific tools or GDB.
+
+You can find an example implementation at:
+`drivers/media/platform/qcom/venus/core.c
+<https://elixir.bootlin.com/linux/v6.11.6/source/drivers/media/platform/qcom/venus/core.c#L30>`__
+
+**Copyright** ©2024 : Collabora
diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
new file mode 100644
index 000000000000..77ec17d1c119
--- /dev/null
+++ b/Documentation/process/debugging/index.rst
@@ -0,0 +1,65 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Debugging advice for Linux Kernel developers
+============================================
+
+.. toctree::
+   :maxdepth: 1
+
+   driver_development_debugging_guide
+   userspace_debugging_guide
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
+
+General debugging advice
+========================
+
+Depending on the issue, a different set of tools is available to track down the
+problem or even to realize whether there is one in the first place.
+
+As a first step you have to figure out what kind of issue you want to debug.
+Depending on the answer, your methodology and choice of tools may vary.
+
+Do I need to debug with limited access?
+---------------------------------------
+
+Do you have limited access to the machine or are you unable to stop the running
+execution?
+
+In this case your debugging capability depends on built-in debugging support of
+provided distro kernel.
+The :doc:`/process/debugging/userspace_debugging_guide` provides a brief
+overview over range of possible debugging tools in that situation. You can
+check the capability of your kernel, in most cases, by looking into config file
+within the /boot folder.
+
+Do I have root access to the system?
+------------------------------------
+
+Are you easily able to replace the module in question or to install a new
+kernel?
+
+In that case your range of available tools is a lot bigger, you can find the
+tools in the :doc:`/process/debugging/driver_development_debugging_guide`.
+
+Is timing a factor?
+-------------------
+
+It is important to understand if the problem you want to debug manifests itself
+consistently (i.e. given a set of inputs you always get the same, incorrect
+output), or inconsistently. If it manifests itself inconsistently, some timing
+factor might be at play. If inserting delays into the code does change the
+behavior, then quite likely timing is a factor.
+
+When timing does alter the outcome of the code execution using a simple
+printk() for debugging purposes may not work, a similar alternative is to use
+trace_printk() , which logs the debug messages to the trace file instead of the
+kernel log.
+
+**Copyright** ©2024 : Collabora
diff --git a/Documentation/process/debugging/userspace_debugging_guide.rst b/Documentation/process/debugging/userspace_debugging_guide.rst
new file mode 100644
index 000000000000..a7c94407bcae
--- /dev/null
+++ b/Documentation/process/debugging/userspace_debugging_guide.rst
@@ -0,0 +1,278 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================
+Userspace debugging advice
+==========================
+
+A brief overview of common tools to debug the Linux Kernel from userspace.
+For debugging advice aimed at driver developer go :doc:`here
+</process/debugging/driver_development_debugging_guide>`.
+For general debugging advice, see :doc:`general advice document
+</process/debugging/index>`.
+
+.. contents::
+    :depth: 3
+
+The following sections show you the available tools.
+
+Dynamic debug
+-------------
+
+Mechanism to filter what ends up in the kernel log by dis-/en-abling log
+messages.
+
+Prerequisite: ``CONFIG_DYNAMIC_DEBUG``
+
+Dynamic debug is only able to target:
+
+- pr_debug()
+- dev_dbg()
+- print_hex_dump_debug()
+- print_hex_dump_bytes()
+
+Therefore the usability of this tool is, as of now, quite limited as there is
+no uniform rule for adding debug prints to the codebase, resulting in a variety
+of ways these prints are implemented.
+
+Also, note that most debug statements are implemented as a variation of
+dprintk(), which have to be activated via a parameter in respective module,
+dynamic debug is unable to do that step for you.
+
+Here is one example, that enables all available pr_debug() 's within the file::
+
+  $ alias ddcmd='echo $* > /proc/dynamic_debug/control'
+  $ ddcmd '-p; file v4l2-h264.c +p'
+  $ grep =p /proc/dynamic_debug/control
+   drivers/media/v4l2-core/v4l2-h264.c:372 [v4l2_h264]print_ref_list_b =p
+   "ref_pic_list_b%u (cur_poc %u%c) %s"
+   drivers/media/v4l2-core/v4l2-h264.c:333 [v4l2_h264]print_ref_list_p =p
+   "ref_pic_list_p (cur_poc %u%c) %s\n"
+
+**When should you use this over Ftrace ?**
+
+- When the code contains one of the valid print statements (see above) or when
+  you have added multiple pr_debug() statements during development
+- When timing is not an issue, meaning if multiple pr_debug() statements in
+  the code won't cause delays
+- When you care more about receiving specific log messages than tracing the
+  pattern of how a function is called
+
+For the full documentation see :doc:`/admin-guide/dynamic-debug-howto`
+
+Ftrace
+------
+
+Prerequisite: ``CONFIG_DYNAMIC_FTRACE``
+
+This tool uses the tracefs file system for the control files and output files,
+that file system will be mounted as a ``tracing`` folder, which can be found in
+either ``/sys/kernel/`` or ``/sys/debug/kernel/``.
+
+Some of the most important operations for debugging are:
+
+- You can perform a function trace by adding a function name to the
+  ``set_ftrace_filter`` file (which accepts any function name found within the
+  ``available_filter_functions`` file) or you can specifically disable certain
+  functions by adding their names to the ``set_ftrace_notrace`` file (More info
+  at: :ref:`trace/ftrace:dynamic ftrace`).
+- In order to find out where the calls originates from you can activate the
+  ``func_stack_trace`` option under ``options/func_stack_trace``.
+- Tracing the children of a function call and showing the return values is
+  possible by adding the desired function in the ``set_graph_function`` file
+  (requires config ``FUNCTION_GRAPH_RETVAL``) more info at
+  :ref:`trace/ftrace:dynamic ftrace with the function graph tracer`.
+
+For the full Ftrace documentation see :doc:`/trace/ftrace`
+
+Or you could also trace for specific events by :ref:`using event tracing
+<trace/events:2. using event tracing>`, which can be defined as described here:
+:ref:`Creating a custom Ftrace tracepoint
+<process/debugging/driver_development_debugging_guide:ftrace>`.
+
+For the full Ftrace event tracing documentation see :doc:`/trace/events`
+
+.. _read_ftrace_log:
+
+Reading the ftrace log
+~~~~~~~~~~~~~~~~~~~~~~
+
+The ``trace`` file can be read just like any other file (``cat``, ``tail``, ``head``,
+``vim``, etc.), the size of the file is limited by the ``buffer_size_kb`` (``echo
+1000 > buffer_size_kb``). The :ref:`trace/ftrace:trace_pipe` will behave
+similar to the ``trace`` file, but whenever you read from the file the content is
+consumed.
+
+Kernelshark
+~~~~~~~~~~~
+
+A GUI interface to visualize the traces as a graph and list view from the
+output of the `trace-cmd
+<https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/>`__ application.
+
+For the full documentation see `<https://kernelshark.org/Documentation.html>`__
+
+Perf & alternatives
+-------------------
+
+The tools mentioned above provide ways to inspect kernel code, results, variable values, etc.
+Sometimes you have to find out first where to look and for those cases, a box of
+performance tracking tools can help you to frame the issue.
+
+Why should you do a performance analysis?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A performance analysis is a good first step when among other reasons:
+
+- you cannot define the issue
+- you do not know where it occurs
+- the running system should not be interrupted or it is a remote system, where
+  you cannot install a new module/kernel
+
+How to do a simple analysis with linux tools?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+For the start of a performance analysis, you can start with the usual tools
+like:
+
+- ``top`` / ``htop`` / ``atop`` (*get an overview of the system load, see spikes on
+  specific processes*)
+- ``mpstat -P ALL`` (*look at the load distribution among CPUs*)
+- ``iostat -x`` (*observe input and output devices utilization and performance*)
+- ``vmstat`` (*overview of memory usage on the system*)
+- ``pidstat`` (*similar to* ``vmstat`` *but per process, to dial it down to the
+  target*)
+- ``strace -tp $PID`` (*once you know the process, you can figure out how it
+  communicates with the Kernel*)
+
+These should help to narrow down the areas to look at sufficiently.
+
+Diving deeper with perf
+~~~~~~~~~~~~~~~~~~~~~~~
+
+The **perf** tool provides a series of metrics and events to further dial down
+on issues.
+
+Prerequisite: build or install perf on your system
+
+Gather statistics data for finding all files starting with ``gcc`` in ``/usr``::
+
+  # perf stat -d find /usr -name 'gcc*' | wc -l
+
+   Performance counter stats for 'find /usr -name gcc*':
+
+     1277.81 msec    task-clock             #    0.997 CPUs utilized
+     9               context-switches       #    7.043 /sec
+     1               cpu-migrations         #    0.783 /sec
+     704             page-faults            #  550.943 /sec
+     766548897       cycles                 #    0.600 GHz                         (97.15%)
+     798285467       instructions           #    1.04  insn per cycle              (97.15%)
+     57582731        branches               #   45.064 M/sec                       (2.85%)
+     3842573         branch-misses          #    6.67% of all branches             (97.15%)
+     281616097       L1-dcache-loads        #  220.390 M/sec                       (97.15%)
+     4220975         L1-dcache-load-misses  #    1.50% of all L1-dcache accesses   (97.15%)
+     <not supported> LLC-loads
+     <not supported> LLC-load-misses
+
+   1.281746009 seconds time elapsed
+
+   0.508796000 seconds user
+   0.773209000 seconds sys
+
+
+  52
+
+The availability of events and metrics depends on the system you are running.
+
+For the full documentation see
+`<https://perf.wiki.kernel.org/index.php/Main_Page>`__
+
+Perfetto
+~~~~~~~~
+
+A set of tools to measure and analyze how well applications and systems perform.
+You can use it to:
+
+* identify bottlenecks
+* optimize code
+* make software run faster and more efficiently.
+
+**What is the difference between perfetto and perf?**
+
+* perf is tool as part of and specialized for the Linux Kernel and has CLI user
+  interface.
+* perfetto cross-platform performance analysis stack, has extended
+  functionality into userspace and provides a WEB user interface.
+
+For the full documentation see `<https://perfetto.dev/docs/>`__
+
+Kernel panic analysis tools
+---------------------------
+
+  To capture the crash dump please use ``Kdump`` & ``Kexec``. Below you can find
+  some advice for analysing the data.
+
+  For the full documentation see the :doc:`/admin-guide/kdump/kdump`
+
+  In order to find the corresponding line in the code you can use `faddr2line
+  <https://elixir.bootlin.com/linux/v6.11.6/source/scripts/faddr2line>`__, note
+  that you need to enable ``CONFIG_DEBUG_INFO`` for that to work.
+
+  An alternative to using ``faddr2line`` is the use of ``objdump`` (and it's
+  derivatives for the different platforms like ``aarch64-linux-gnu-objdump``),
+  take this line as an example:
+
+  ``[  +0.000240]  rkvdec_device_run+0x50/0x138 [rockchip_vdec]``.
+
+  We can find the corresponding line of code by executing::
+
+    aarch64-linux-gnu-objdump -dS drivers/staging/media/rkvdec/rockchip-vdec.ko | grep rkvdec_device_run\>: -A 40
+    0000000000000ac8 <rkvdec_device_run>:
+     ac8:	d503201f 	nop
+     acc:	d503201f 	nop
+    {
+     ad0:	d503233f 	paciasp
+     ad4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
+     ad8:	910003fd 	mov	x29, sp
+     adc:	a90153f3 	stp	x19, x20, [sp, #16]
+     ae0:	a9025bf5 	stp	x21, x22, [sp, #32]
+        const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+     ae4:	f9411814 	ldr	x20, [x0, #560]
+        struct rkvdec_dev *rkvdec = ctx->dev;
+     ae8:	f9418015 	ldr	x21, [x0, #768]
+        if (WARN_ON(!desc))
+     aec:	b4000654 	cbz	x20, bb4 <rkvdec_device_run+0xec>
+        ret = pm_runtime_resume_and_get(rkvdec->dev);
+     af0:	f943d2b6 	ldr	x22, [x21, #1952]
+        ret = __pm_runtime_resume(dev, RPM_GET_PUT);
+     af4:	aa0003f3 	mov	x19, x0
+     af8:	52800081 	mov	w1, #0x4                   	// #4
+     afc:	aa1603e0 	mov	x0, x22
+     b00:	94000000 	bl	0 <__pm_runtime_resume>
+        if (ret < 0) {
+     b04:	37f80340 	tbnz	w0, #31, b6c <rkvdec_device_run+0xa4>
+        dev_warn(rkvdec->dev, "Not good\n");
+     b08:	f943d2a0 	ldr	x0, [x21, #1952]
+     b0c:	90000001 	adrp	x1, 0 <rkvdec_try_ctrl-0x8>
+     b10:	91000021 	add	x1, x1, #0x0
+     b14:	94000000 	bl	0 <_dev_warn>
+        *bad = 1;
+     b18:	d2800001 	mov	x1, #0x0                   	// #0
+     ...
+
+  Meaning, in this line from the crash dump::
+
+    [  +0.000240]  rkvdec_device_run+0x50/0x138 [rockchip_vdec]
+
+  I can take the ``0x50`` as offset, which I have to add to the base address
+  of the corresponding function, which I find in this line::
+
+    0000000000000ac8 <rkvdec_device_run>:
+
+  The result of ``0xac8 + 0x50 = 0xb18``
+  And when I search for that address within the function I get the
+  following line::
+
+    *bad = 1;
+    b18:      d2800001        mov     x1, #0x0
+
+**Copyright** ©2024 : Collabora
diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index 6455eba3ef0c..aa12f2660194 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -72,13 +72,15 @@ beyond).
 Dealing with bugs
 -----------------
 
-Bugs are a fact of life; it is important that we handle them properly.
-The documents below describe our policies around the handling of a couple
-of special classes of bugs: regressions and security problems.
+Bugs are a fact of life; it is important that we handle them properly. The
+documents below provide general advice about debugging and describe our
+policies around the handling of a couple of special classes of bugs:
+regressions and security problems.
 
 .. toctree::
    :maxdepth: 1
 
+   debugging/index
    handling-regressions
    security-bugs
    cve

-- 
2.25.1

